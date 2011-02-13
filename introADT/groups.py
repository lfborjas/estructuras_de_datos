class Set:
    def __init__(self, *ary):
        self.entries = list(ary)

    def __add__(self, enum):
        import copy
        r = copy.copy(self.entries)
        [r.append(e) for e in enum.entries if e not in self.entries]
        return Set(*r)

    def __sub__(self, enum):
        return Set(*[e for e in self.entries if e not in enum.entries])

    def __iter__(self):
        for entry in self.entries:
            yield entry

arias = Set("a", "b", "c", "d")
otro =  Set("b", "e", "f", "g", "h")

print "Todos"
for alumno in arias + otro:
    print alumno

print "Parejas"
for pareja in zip(arias, otro - arias):
    print pareja


