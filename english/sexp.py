import re
def parse(s):
    toks = re.findall(r"\(|\)|'|[^\s()']+", s.upper()); pos = 0
    def rd():
        nonlocal pos
        t = toks[pos]; pos += 1
        if t == "(":
            out = []
            while toks[pos] != ")": out.append(rd())
            pos += 1; return out
        if t == "'": return ["QUOTE", rd()]
        return t
    return rd()
