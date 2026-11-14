#!/usr/bin/env python3
"""Compile Attempto sentences with the ACL2 compiler.
   compile_acl2.py APE LEXICON IN OUT
Formats:
  IN  lines "name | sentence"
  OUT lines "name | paraphrase | statement"  or  "name | REJECTED | reason"
english/parse.pl parses and prints each DRS; acl2/compiler.lisp translates."""
import os, re, subprocess, sys, tempfile
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TOOLS = os.environ.get("TOOLS_DIR", os.path.expanduser("~/tools"))
ACL2 = os.path.join(TOOLS, "acl2/saved_acl2")
ape, lex, inp, outp = sys.argv[1:5]
with tempfile.TemporaryDirectory() as tmp:
    drs = os.path.join(tmp, "drs.lsp")
    subprocess.run(["swipl", os.path.join(ROOT, "english/parse.pl"), ape, lex, inp, drs], check=True)
    script = f'''(include-book "{ROOT}/acl2/compiler")
(set-fmt-hard-right-margin 100000 state)
(set-fmt-soft-right-margin 100000 state)
(defun run-all (ch state)
  (declare (xargs :mode :program :stobjs state))
  (mv-let (eof form state) (read-object ch state)
    (if eof state
      (prog2$
       (if (eq (nth 1 form) :unparsed)
           (cw "RESULT|~s0|REJECTED|unparsed~%" (nth 0 form))
         (mv-let (err stmt) (compile-drs (nth 2 form))
           (if err (cw "RESULT|~s0|REJECTED|~s1~%" (nth 0 form) err)
             (cw "RESULT|~s0|~s1|~x2~%" (nth 0 form) (nth 1 form) stmt))))
       (run-all ch state)))))
(mv-let (ch state) (open-input-channel "{drs}" :object state)
  (let ((state (run-all ch state))) (close-input-channel ch state)))
'''
    r = subprocess.run([ACL2], input=script, capture_output=True, text=True)
    lines = re.findall(r"RESULT\|(.*)", r.stdout)
    with open(outp, "w") as f:
        for l in lines:
            name, a, b = l.split("|", 2)
            f.write(f"{name} | {a} | {b.lower() if a != 'REJECTED' else b}\n")
