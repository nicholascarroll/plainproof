% The dictionary: what each content word means in ACL2.
% One word, one meaning.  Glosses and checked examples are in acl2/dictionary.lisp.

% Classifying nouns:  "X is a true-list"  means  (true-listp x)
type_noun('true-list', 'true-listp').
type_noun(pair, 'consp').

% Result nouns, with arity:  "Z is an append of X and Y"  means  z = (append x y)
result_noun(length, 'len', 1).
result_noun(reversal, 'rev', 1).
result_noun(reverse, 'reverse', 1).
result_noun('list-fix', 'true-list-fix', 1).
result_noun('natural-value', 'nfix', 1).
result_noun(append, 'append', 2).
result_noun(revappend, 'revappend', 2).
result_noun(cons, 'cons', 2).
result_noun(take, 'take', 2).
result_noun(nthcdr, 'nthcdr', 2).
result_noun(repeat, 'repeat', 2).
result_noun(sum, '+', 2).
result_noun(difference, '-', 2).

result_noun(head, 'car', 1).
result_noun(tail, 'cdr', 1).
result_noun('last-pair', 'last', 1).
result_noun('final-cdr', 'final-cdr', 1).
result_noun(flattening, 'flatten', 1).
result_noun(deduplication, 'remove-duplicates-equal', 1).
result_noun(nth, 'nth', 2).
result_noun(rcons, 'rcons', 2).
result_noun(removal, 'remove-equal', 2).
result_noun(duplicity, 'duplicity', 2).
result_noun(intersection, 'intersection-equal', 2).
result_noun(union, 'union-equal', 2).
result_noun('set-difference', 'set-difference-equal', 2).
result_noun(index, 'index-of', 2).
result_noun(listpos, 'listpos', 2).
result_noun('update-nth', 'update-nth', 3).

% Relation nouns:  "A is a member of X"  means  (member-equal a x)
relation_noun(member, 'member-equal').
relation_noun(subset, 'subsetp-equal').
relation_noun(prefix, 'prefixp').
relation_noun(suffix, 'suffixp').
relation_noun(sublist, 'sublistp').

% Relation adjectives:  "X is set-equivalent-to Y"  means  (set-equiv x y)
relation_adjective('set-equivalent-to', 'set-equiv').
relation_adjective('list-equivalent-to', 'list-equiv').

% Comparisons:  "N is smaller than M"  means  (< n m)
comparison(small, '<').

% Adjectives:  "X is atomic"  means  (atom x)
adjective(atomic, 'atom').
adjective('duplicate-free', 'no-duplicatesp-equal').
adjective(natural, 'natp').

% Constants:  "Nil"  means  nil
constant('Nil', 'nil').
