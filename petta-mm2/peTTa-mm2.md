# PeTTa Functions Missing In MM2

This file lists functions that are exposed by PeTTa but are not exposed by MM2 in `/MORK/kernel/src/pure.rs`.

Notes:

- `Defined in metta.pl` means the function has a local clause/implementation in `src/metta.pl`.
- `Registered only` means `metta.pl` exposes the name, but the implementation is imported, built into Prolog, or handled elsewhere.
- This is a surface-API gap list, not a semantic-equivalence proof.

## Arithmetic and comparison

| Function | Definition / usage |
| --- | --- |
| `<` | Defined in `metta.pl`: boolean comparison wrapper |
| `>` | Defined in `metta.pl`: boolean comparison wrapper |
| `==` | Defined in `metta.pl`: boolean equality wrapper |
| `!=` | Defined in `metta.pl`: boolean inequality wrapper |
| `=` | Defined in `metta.pl`: unification-as-boolean wrapper |
| `=?` | Defined in `metta.pl`: double-negation unification check |
| `=alpha` | Defined in `metta.pl`: alpha-equivalence boolean wrapper |
| `<=` | Defined in `metta.pl`: boolean comparison wrapper |
| `>=` | Defined in `metta.pl`: boolean comparison wrapper |


## Constraint arithmetic

| Function | Definition / usage |
| --- | --- |
| `#+` | Defined in `metta.pl`: CLPFD addition |
| `#-` | Defined in `metta.pl`: CLPFD subtraction |
| `#*` | Defined in `metta.pl`: CLPFD multiplication |
| `#div` | Defined in `metta.pl`: CLPFD integer division |
| `#//` | Defined in `metta.pl`: CLPFD floor division |
| `#mod` | Defined in `metta.pl`: CLPFD modulo |
| `#min` | Defined in `metta.pl`: CLPFD min |
| `#max` | Defined in `metta.pl`: CLPFD max |
| `#<` | Defined in `metta.pl`: CLPFD less-than test |
| `#>` | Defined in `metta.pl`: CLPFD greater-than test |
| `#=` | Defined in `metta.pl`: CLPFD equality test |
| `#\\=` | Defined in `metta.pl`: CLPFD disequality test |

## Boolean and nondeterminism

| Function | Definition / usage |
| --- | --- |
| `and` | Defined in `metta.pl`: boolean conjunction |
| `or` | Defined in `metta.pl`: boolean disjunction |
| `not` | Defined in `metta.pl`: boolean negation |
| `xor` | Defined in `metta.pl`: boolean xor |
| `implies` | Defined in `metta.pl`: boolean implication |
| `superpose` | Defined in `metta.pl`: `member/2`-based nondeterministic enumeration |
| `empty` | Defined in `metta.pl`: always fails |

## List, tuple, and collection helpers

| Function | Definition / usage |
| --- | --- |
| `cons-atom` | Defined in `metta.pl`: build list cell |
| `decons-atom` | Defined in `metta.pl`: split list into head and tail |
| `first-from-pair` | Defined in `metta.pl`: first pair element |
| `first` | Defined in `metta.pl`: first pair element |
| `second-from-pair` | Defined in `metta.pl`: second pair element |
| `unique-atom` | Defined in `metta.pl`: uses `list_to_set/2` |
| `alpha-unique-atom` | Defined in `metta.pl`: alpha-equivalence-aware setification |
| `sort-atom` | Defined in `metta.pl`: uses `msort/2` |
| `size-atom` | Defined in `metta.pl`: uses `length/2` |
| `car-atom` | Defined in `metta.pl`: head of list |
| `cdr-atom` | Defined in `metta.pl`: tail of list |
| `index-atom` | Defined in `metta.pl`: uses `nth0/3` |
| `is-member` | Defined in `metta.pl`: membership with explicit false case |
| `exclude-item` | Defined in `metta.pl`: remove all matches from list |
| `subtraction-atom` | Defined in `metta.pl`: multiset subtraction |
| `union-atom` | Defined in `metta.pl`: uses `append/3` |
| `intersection-atom` | Defined in `metta.pl`: uses `intersection/3` |
| `append` |  concatenates lists |
| `foldl` |  left fold over a list with an accumulator |
| `last` |  returns the last element of a list |
| `length` |  returns or constrains the length of a list |
| `list_to_set` |  removes duplicates from a list while keeping one copy of each element |
| `maplist` |  applies a predicate/function across list elements |
| `msort` |  stable sort that keeps duplicates |
| `sort` |  sorts and removes duplicates |
| `foldl-atom` | Defined in `metta.pl`: left fold via `reduce` |
| `map-atom` | Defined in `metta.pl`: map via `reduce` |
| `filter-atom` | Defined in `metta.pl`: filter via `reduce` |
| `min-atom` | Defined in `metta.pl`: uses `min_list/2` |
| `max-atom` | Defined in `metta.pl`: uses `max_list/2` |
| `reverse` |  reverses the order of list elements |

## Representation, parsing, matching, and reflection

| Function | Definition / usage |
| --- | --- |
| `id` | Defined in `metta.pl`: identity |
| `repr` | Defined in `metta.pl`: `swrite/2` representation |
| `repra` | Defined in `metta.pl`: `term_to_atom/2` representation |
| `parse` | Defined in `metta.pl`: `sread/2` parsing wrapper |
| `match` | Defined in `metta.pl`: used by type inference and matching surface |
| `get-type` | Defined in `metta.pl`: dynamic type predicate |
| `get-metatype` | Defined in `metta.pl`: returns `Variable`, `Grounded`, `Expression`, `Symbol` |
| `get-mettatype` | Registered only: likely a surface alias or typo variant of `get-metatype` |
| `is-var` | Defined in `metta.pl`: variable test |
| `is-expr` | Defined in `metta.pl`: list/expression test |
| `is-space` | Defined in `metta.pl`: `&...`-space test |
| `concat` | Registered only: concatenates values, typically strings, atoms, or lists depending on usage |
| `sread` | Defined in `metta.pl`: used by `parse/2` |
| `atom_concat` | Registered only: concatenates atoms into a single atom |
| `atom_chars` | Registered only: converts between an atom and a list of characters |
| `copy_term` | Registered only: makes a structural copy of a term with fresh variables |
| `term_hash` | Registered only: computes a hash value for a term |


## State, evaluation, and execution helpers

| Function | Definition / usage |
| --- | --- |
| `bind!` | Defined in `metta.pl`: state binding wrapper |
| `change-state!` | Defined in `metta.pl`: uses `nb_setval/2` |
| `get-state` | Defined in `metta.pl`: uses `nb_getval/2` |
| `eval` | Defined in `metta.pl`: `translate_expr` plus `call_goals` |
| `let` | Registered only |
| `let*` | Registered only |
| `reduce` | Defined in `metta.pl`: used by fold/map/filter helpers |
| `mm2-exec` | Registered only |
| `set_hook` | Registered only |


## Interop and meta-programming

| Function | Definition / usage |
| --- | --- |
| `py-call` | Defined in `metta.pl`: Python bridge via Janus |
| `import!` | Defined in `metta.pl`: file/Python import helper |
| `import_prolog_function` | Defined in `metta.pl`: registers a Prolog predicate name |
| `Predicate` | Defined in `metta.pl`: builds callable term from list |
| `callPredicate` | Defined in `metta.pl`: calls arbitrary predicate |
| `assertzPredicate` | Defined in `metta.pl`: dynamic DB insert |
| `assertaPredicate` | Defined in `metta.pl`: dynamic DB insert at front |
| `retractPredicate` | Defined in `metta.pl`: dynamic DB retract |
| `add-translator-rule!` | Defined in `metta.pl`: adds translator rule |
| `remove-translator-rule!` | Defined in `metta.pl`: removes translator rule |


