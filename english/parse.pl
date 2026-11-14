% Parse Attempto sentences and print each parse (DRS) as an s-expression for the
% ACL2 compiler.  No translation happens here.
%   swipl parse.pl APE LEXICON IN OUT
% IN: lines "name | sentence".  OUT: one Lisp form per line:
%   ("name" "paraphrase" DRS)   or   ("name" :unparsed)
:- initialization(main, main).

main :-
    current_prolog_flag(argv, [Ape, Lex, In, Out]),
    read_file_to_string(In, Text, []),
    split_string(Text, "\n", "", Lines0), exclude(==(""), Lines0, Lines),
    open(Out, write, O),
    forall(member(L, Lines), one(Ape, Lex, L, O)),
    close(O).

one(Ape, Lex, Line, O) :-
    split_string(Line, "|", " ", [Name, Sentence|_]),
    (   ape(Ape, Lex, Sentence, drs, DrsText), term_string(Drs, DrsText),
        ape(Ape, Lex, Sentence, paraphrase, Para)
    ->  numbervars(Drs, 0, _),
        with_output_to(string(S), sx(Drs)),
        with_output_to(string(Line1), (write('('), str(Name), write(' '), str(Para), write(' '), write(S), write(')'))),
        format(O, "~w~n", [Line1])
    ;   with_output_to(string(Line1), (write('('), str(Name), write(' :unparsed)'))),
        format(O, "~w~n", [Line1])
    ).

ape(Ape, Lex, Sentence, Solo, Out) :-
    process_create(Ape, ['-ulexfile', Lex, '-text', Sentence, '-solo', Solo],
                   [stdout(pipe(S)), stderr(null)]),
    read_string(S, _, Out0), close(S),
    normalize_space(string(Out), Out0), Out \== "",
    \+ sub_string(Out, 0, _, _, "<"),
    \+ sub_string(Out, _, _, _, "importance=\"error\"").

% ---- DRS as an s-expression ----
sx('$VAR'(N)) :- !, format("r~w", [N]).
sx(drs(Refs, Conds)) :- !, write('(drs ('), sxs(Refs), write(') ('), sxs(Conds), write('))').
sx(C-_) :- !, sx(C).
sx(=>(A, B)) :- !, write('(if '), sx(A), write(' '), sx(B), write(')').
sx(-(D)) :- !, write('(not '), sx(D), write(')').
sx(v(A, B)) :- !, write('(or '), sx(A), write(' '), sx(B), write(')').
sx(object(R, N, C, U, Op, K)) :- !,
    write('(object '), sx(R), write(' '), str(N), write(' '), str(C), write(' '), str(U),
    write(' '), str(Op), write(' '), sxk(K), write(')').
sx(relation(B, of, X)) :- !, write('(relation '), sx(B), write(' '), sx(X), write(')').
sx(has_part(G, P)) :- !, write('(has-part '), sx(G), write(' '), sx(P), write(')').
sx(predicate(_, be, A, B)) :- !, write('(be '), sx(A), write(' '), sx(B), write(')').
sx(property(P, A, pos)) :- !, write('(property '), sx(P), write(' '), str(A), write(')').
sx(property(P, A, pos, X)) :- !, write('(property2 '), sx(P), write(' '), str(A), write(' '), sx(X), write(')').
sx(property(P, A, comp_than, X)) :- !, write('(compare '), sx(P), write(' '), str(A), write(' '), sx(X), write(')').
sx(int(N)) :- integer(N), !, format('(int ~w)', [N]).
sx(named(C)) :- !, write('(named '), str(C), write(')').
sx(T) :- write('(unsupported '), with_output_to(string(S), print(T)), str(S), write(')').
% Every name is printed as a string, so nothing in it can be read as Lisp syntax.
str(A) :- atom_string(A, S), split_string(S, "\"\\", "", Parts),
    atomic_list_concat(Parts, '_', Safe), format('"~w"', [Safe]).
sxs([]).
sxs([X]) :- !, sx(X).
sxs([X|Xs]) :- sx(X), write(' '), sxs(Xs).
sxk(K) :- integer(K), !, write(K).
sxk(K) :- str(K).
