"""Recover the local-variable table of a stripped Lua 5.1 function.

Decompilers need to know which registers are named locals and which are expression temporaries.
luac records that in debug information, which Microsoft strips. This module rebuilds it, so a
decompiler can run in its debug-information mode instead of guessing.

luac is a single-pass compiler: when it emits an instruction, registers below `nactvar` hold
locals and registers from there up to `freereg` hold temporaries, which are used last-in
first-out and exactly once. infer() replays that allocator in pc order. Every register write
starts as a temporary, and is promoted to a local when the bytecode shows something a temporary
cannot do. The result is a hypothesis: the caller recompiles the decompiled source and keeps it
only if the bytecode is identical.
"""
import struct

(MOVE, LOADK, LOADBOOL, LOADNIL, GETUPVAL, GETGLOBAL, GETTABLE, SETGLOBAL, SETUPVAL, SETTABLE,
 NEWTABLE, SELF, ADD, SUB, MUL, DIV, MOD, POW, UNM, NOT, LEN, CONCAT, JMP, EQ, LT, LE, TEST,
 TESTSET, CALL, TAILCALL, RETURN, FORLOOP, FORPREP, TFORLOOP, SETLIST, CLOSE, CLOSURE,
 VARARG) = range(38)
TESTS = (EQ, LT, LE, TEST, TESTSET)
BX_BIAS = 131071


class Inconsistent(Exception):
    """The bytecode does not fit the model, for example because luac did not produce it."""


def fb2int(x):
    """Decode the "floating point byte" NEWTABLE uses for its size hints."""
    exponent = (x >> 3) & 31
    return x if exponent == 0 else ((x & 7) + 8) << (exponent - 1)


def decode(code):
    """[(opcode, A, B, C, sBx)]"""
    return [(i & 0x3F, (i >> 6) & 0xFF, i >> 23, (i >> 14) & 0x1FF, (i >> 14) - BX_BIAS)
            for (i,) in struct.iter_unpack("<I", code)]


def infer(f):
    """Return ([(register, startpc, endpc)], numeric for loops, generic for loops)."""
    ins = decode(f["code"])
    n = len(ins)
    nparams, vararg = f["flags"][1], f["flags"][2]
    nfixed = nparams + (vararg & 1)     # parameters, and `arg` in old-style vararg functions

    # ---- Scopes. Locals die where their block ends, which the jumps reveal. ------------------
    # kills[pc] = [(minimum startpc, minimum register, endpc, block is a loop body)]
    kills = [[] for _ in range(n + 2)]
    loop_exits = set()
    numeric_for = {}                    # FORPREP pc -> A
    generic_for = {}                    # pc of the jump to TFORLOOP -> (A, C)
    back_jumps = {}                     # loop start -> last jump back to it
    skip = set()                        # pcs holding data rather than an instruction
    pc = 0
    while pc < n:
        op, A, B, C, sBx = ins[pc]
        if op == SETLIST and C == 0:
            skip.add(pc + 1)
        elif op == CLOSURE:
            nups = f["functions"][sBx + BX_BIAS]["flags"][0]
            skip.update(range(pc + 1, pc + 1 + nups))
            pc += nups
        pc += 1
    for pc in range(n):
        if pc in skip:
            continue
        op, A, B, C, sBx = ins[pc]
        if op == FORPREP:
            end = pc + 1 + sBx
            numeric_for[pc] = A
            kills[end].append((0, A + 3, end, True))
            kills[end + 1].append((0, A, end + 1, True))
            loop_exits.add(end + 1)
        elif op == JMP:
            target = pc + 1 + sBx
            if sBx < 0:
                if not (ins[target][0] == TFORLOOP and target == pc - 1):
                    back_jumps[target] = max(back_jumps.get(target, -1), pc)
            elif ins[target][0] == TFORLOOP and ins[target + 1][0] == JMP \
                    and target + 2 + ins[target + 1][4] == pc + 1:
                generic_for[pc] = ins[target][1], ins[target][3]
                kills[target].append((0, ins[target][1] + 3, target, True))
                kills[target + 2].append((0, ins[target][1], target + 2, True))
                loop_exits.add(target + 2)
    for target, pc in back_jumps.items():
        if pc > 0 and ins[pc - 1][0] in TESTS:      # repeat ... until: the test sees the body
            kills[pc + 1].append((target + 1, 0, pc + 1, True))
        else:                                       # while
            kills[pc].append((target + 1, 0, pc, True))
        loop_exits.add(pc + 1)
    for pc in range(n):
        op, A, B, C, sBx = ins[pc]
        if pc in skip or op != JMP or sBx < 0 or pc in generic_for:
            continue
        target = pc + 1 + sBx
        last = ins[target - 1]
        # A then-block that is followed by an else closes before its jump over the else part.
        if target - 1 > pc and last[0] == JMP and last[4] >= 0 and target - 1 not in skip \
                and target + last[4] not in loop_exits and target - 1 not in generic_for \
                and ins[target - 2][0] not in TESTS:
            kills[target - 1].append((pc + 2, 0, target - 1, False))
        kills[target].append((pc + 2, 0, target, False))

    # ---- Replay ------------------------------------------------------------------------------
    done = []           # finished locals: (register, startpc, endpc)
    start = [0] * nfixed    # startpc of the active local in each register
    nact = nfixed       # registers below this hold locals
    top = nfixed        # registers from nact up to this hold pending temporaries
    lastw = {}          # register -> pc of the instruction that completed its value
    budget = {}         # pending NEWTABLE register -> hash fields its constructor may still set
    dead = {}           # pending register -> endpc of the block that closed after it was written
    frozen = []         # (jump target, top): temporaries pending at a forward jump
    compared = {}       # register -> (write pc, jump target), when a comparison consumed it
    reassigned = {}     # register -> the same, when it was then rewritten inside that jump
    statement_ended = False

    def promote(count):
        """Registers below `count` are locals, live since the instruction that last wrote them."""
        nonlocal nact, top
        for r in range(nact, count):
            s = lastw.get(r, -1) + 1
            if r in reassigned and lastw[r] < reassigned[r][1] <= pc:
                # Compared, conditionally reassigned, then read after the conditional: the
                # variable was declared before the comparison.
                s = reassigned[r][0] + 1
            if start and s < start[-1]:
                s = start[-1]
            start.append(s)
            dead.pop(r, None)
            budget.pop(r, None)
        nact = max(nact, count)
        top = max(top, nact)

    def kill_from(reg, end):
        nonlocal nact, top
        reg = max(reg, nfixed)
        if reg < nact:
            done.extend((r, start[r], max(end, start[r])) for r in range(reg, nact))
            del start[reg:]
            nact = top = reg
            dead.clear()
            budget.clear()
            frozen[:] = [(t, min(limit, reg)) for t, limit in frozen if min(limit, reg) > 0]

    def pop_to(reg, used=True):
        """Drop pending temporaries from `reg` up. A value that nothing used, written in a block
        that has since closed, was an unused local of that block."""
        nonlocal top
        for r in range(reg, top):
            if r in dead and not used:
                done.append((r, lastw[r] + 1, max(dead[r], lastw[r] + 1)))
            dead.pop(r, None)
            budget.pop(r, None)
        top = min(top, reg)

    def is_arm(reg):
        """Is the pending value one arm of an and/or/comparison expression?"""
        w = lastw[reg]
        return (ins[w][0] == LOADBOOL and ins[w][3]) or (w + 1 < n and ins[w + 1][0] == JMP)

    def frozen_limit():
        return max((limit for _, limit in frozen), default=0)

    def consume(regs):
        """Pop the pending temporaries an instruction reads."""
        held = [r for r in regs if nact <= r < frozen_limit()]
        if held:
            promote(max(held) + 1)      # read inside a conditional it was computed before
        temps = [r for r in regs if r >= nact]
        if not temps:
            return
        highest = max(temps)
        if highest >= top:              # read again after something consumed it
            if any(r not in lastw for r in range(nact, highest + 1)):
                raise Inconsistent("read of a register that was never written")
            promote(highest + 1)
        elif highest < top - 1:         # read while newer temporaries stay pending
            promote(top)
        else:
            pop_to(min(temps))

    def read(regs, dest):
        # An operand below the destination is a local: luac would have reused a temporary's slot.
        below = [r for r in regs if nact <= r < dest]
        if below:
            promote(max(below) + 1)
        consume(regs)

    def write(A, count=1):
        nonlocal top
        if nact <= A < frozen_limit():
            promote(A + 1)              # assigned inside a conditional it was computed before
        if nact <= A < top and A not in dead and not is_arm(A):
            promote(A + 1)              # overwrites a value nothing consumed: an assignment
        if A >= nact:
            if A > top:
                promote(A)              # the registers below a new temporary are occupied
            pop_to(A, used=False)
            top = A + count
            for r in range(A, A + count):
                if r in compared and compared[r][1] > pc:
                    reassigned[r] = compared[r]
                else:
                    reassigned.pop(r, None)
                compared.pop(r, None)
                lastw[r] = pc
        elif A + count > nact:
            pop_to(nact, used=False)
            top = A + count
            for r in range(nact, A + count):
                lastw[r] = pc

    def rk(operand):
        return [operand] if operand < 256 else []

    pc = 0
    while pc < n:
        for min_start, min_reg, end, loop in kills[pc]:
            reg = min_reg
            while reg < nact and start[reg] < min_start:
                reg += 1
            if reg < nact:
                kill_from(reg, end)
            for r in range(max(nact, min_reg), top):
                if lastw[r] + 1 >= min_start and r not in dead:
                    dead[r] = end
            if loop:
                reg = nact
                while reg < top and reg not in dead:
                    reg += 1
                pop_to(reg, used=False)
        while frozen and frozen[-1][0] <= pc:
            frozen.pop()
        if pc in skip:
            pc += 1
            continue
        op, A, B, C, sBx = ins[pc]

        if statement_ended:
            # Whatever is still pending when a statement ends is a local, unless this
            # instruction continues a multiple assignment.
            statement_ended = False
            continues = top > nact and (
                (op in (SETGLOBAL, SETUPVAL) and A == top - 1)
                or (op == SETTABLE and C == top - 1)
                or (op == MOVE and B == top - 1 and A < top - 1))
            if not continues:
                while top > nact and top - 1 in dead:
                    pop_to(top - 1, used=False)
                promote(top)

        if op == MOVE:
            read([B], A)
            write(A)
        elif op == LOADK and pc + 1 < n and ins[pc + 1][0] == SELF and ins[pc + 1][3] == A \
                and ins[pc + 1][1] == A - 2:
            pass        # a method name beyond the RK range, parked above the call frame
        elif op in (LOADK, LOADBOOL, GETUPVAL, GETGLOBAL):
            write(A)
        elif op == LOADNIL:
            write(A, B - A + 1)
        elif op == GETTABLE:
            read([B] + rk(C), A)
            write(A)
        elif op == NEWTABLE:
            write(A)
            if A >= nact:
                budget[A] = fb2int(C)
        elif op == SELF:
            read([B] + (rk(C) if C != A + 2 else []), A)
            write(A, 2)
        elif ADD <= op <= POW:
            read(rk(B) + rk(C), A)
            write(A)
        elif op in (UNM, NOT, LEN, TESTSET):
            read([B], A)
            write(A)
        elif op == CONCAT:
            read(list(range(B, C + 1)), A)
            write(A)
        elif op == JMP:
            if pc in generic_for:
                base, nvars = generic_for[pc]
                if top < base + 3:
                    raise Inconsistent("generic for without its state")
                promote(base)
                for r in range(base, base + 3):
                    lastw[r] = pc - 1
                promote(base + 3)
                for r in range(base + 3, base + 3 + nvars):
                    lastw[r] = pc
                top = base + 3 + nvars
                promote(top)
            elif sBx >= 0:
                # Temporaries pending here belong to an expression that continues at the
                # target, so nothing in between may touch them. The slot that receives the
                # conditional's own value is not one of them.
                limit = top
                if pc and ins[pc - 1][0] == TESTSET:
                    limit = min(limit, ins[pc - 1][1])
                elif top > nact and is_arm(top - 1):
                    limit = top - 1
                if limit > nact:
                    frozen.append((pc + 1 + sBx, limit))
                    frozen.sort(reverse=True)
        elif op in (EQ, LT, LE):
            operands = [r for r in rk(B) + rk(C) if nact <= r < top]
            consume(rk(B) + rk(C))
            if pc + 1 < n and ins[pc + 1][0] == JMP and ins[pc + 1][4] >= 0:
                for r in operands:
                    if r >= top:
                        compared[r] = lastw[r], pc + 2 + ins[pc + 1][4]
        elif op == TEST:
            consume([A])
        elif op in (CALL, TAILCALL):
            if A < nact:
                raise Inconsistent("call through a local's register")
            if B and A + B > top:
                raise Inconsistent("call with unset arguments")
            pop_to(A)
            if op == TAILCALL or C == 1:
                statement_ended = True
            else:
                write(A, C - 1 if C else 1)
        elif op == RETURN:
            if B >= 2:
                consume(list(range(A, A + B - 1)))
            elif B == 0 and A >= nact:
                pop_to(A)
            statement_ended = True
        elif op == FORPREP:
            if top < A + 3:
                raise Inconsistent("numeric for without its limits")
            promote(A)
            for r in range(A, A + 3):
                lastw[r] = pc - 1
            promote(A + 3)
            lastw[A + 3] = pc
            top = A + 4
            promote(top)
        elif op in (FORLOOP, TFORLOOP, CLOSE):
            pass
        elif op == SETLIST:
            if A < nact or A >= top:
                raise Inconsistent("SETLIST outside a table constructor")
            pop_to(A + 1)
            lastw[A] = pc
        elif op == CLOSURE:
            nups = f["functions"][sBx + BX_BIAS]["flags"][0]
            write(A)
            for capture in ins[pc + 1:pc + 1 + nups]:
                if capture[0] == MOVE and capture[2] >= nact:
                    if capture[2] >= top:
                        raise Inconsistent("capture of an unset register")
                    lastw[A] = pc + nups
                    promote(capture[2] + 1)     # only locals can be captured
            if A >= nact:
                lastw[A] = pc + nups
        elif op == VARARG:
            write(A, B - 1 if B else 1)
        elif op in (SETGLOBAL, SETUPVAL):
            consume([A])
            statement_ended = True
        elif op == SETTABLE:
            if nact <= A < top and budget.get(A, 0) > 0:
                # A field of the table constructor in A, which stays pending.
                budget[A] -= 1
                below = [r for r in rk(B) + rk(C) if nact <= r < A]
                if below:
                    promote(max(below) + 1)
                if any(r >= top for r in rk(B) + rk(C)):
                    raise Inconsistent("constructor field reads an unset register")
                if A >= nact:
                    pop_to(A + 1)
                    lastw[A] = pc
            else:
                if A >= nact and A in budget:
                    promote(A + 1)      # t = {...}; t.x = ...: the table is a local
                # Table, key and value are evaluated in that order, so a pending register
                # that is out of order is a local.
                order = [A] + rk(B) + rk(C)
                highest = -1
                for r in order:
                    if nact <= r < top:
                        if r < highest:
                            promote(r + 1)
                        highest = max(highest, r)
                consume(order)
                statement_ended = True
        else:
            raise Inconsistent(f"opcode {op}")
        pc += 1

    done.extend((r, start[r], n - 1) for r in range(nfixed, nact))
    done.extend((r, 0, n - 1) for r in range(nfixed))
    return done, numeric_for, generic_for


def annotate(f, counter=None):
    """Fill in the debug information of function `f` and its nested functions.

    Sets f["locals"] to [(name, startpc, endpc)] and f["lineinfo"], and the "upvalues" names of
    each nested function. Names are NUL-terminated, as in a chunk. Raises Inconsistent.
    """
    counter = counter or [0]
    index = counter[0]
    counter[0] += 1
    found, numeric_for, generic_for = infer(f)
    found.sort(key=lambda local: (local[1], local[0], local[2]))
    size = len(f["code"]) // 4
    nparams, vararg = f["flags"][1], f["flags"][2]

    hidden = {}
    for pc, base in numeric_for.items():
        for i, name in enumerate((b"(for index)", b"(for limit)", b"(for step)")):
            hidden[base + i, pc] = name
    for pc, (base, _) in generic_for.items():
        for i, name in enumerate((b"(for generator)", b"(for state)", b"(for control)")):
            hidden[base + i, pc] = name
    named = []
    for reg, startpc, endpc in found:
        name = hidden.get((reg, startpc))
        if name is None and vararg & 1 and reg == nparams and startpc == 0:
            name = b"arg"
        if name is None:
            name = b"l_%d_%d" % (index, sum(1 for local in named if local[0].startswith(b"l_")))
        named.append((name + b"\0", startpc, endpc, reg))
    f["locals"] = [local[:3] for local in named]
    # unluac treats a function without line information as stripped and ignores its locals.
    f["lineinfo"] = struct.pack("<I", 1) * size

    def name_at(reg, pc):
        for name, startpc, endpc, r in reversed(named):
            if r == reg and startpc <= pc and (pc < endpc or endpc == size - 1):
                return name
        return None

    ins = decode(f["code"])
    pc = 0
    while pc < size:
        op, _, _, C, sBx = ins[pc]
        if op == SETLIST and C == 0:
            pc += 1
        elif op == CLOSURE:
            function = f["functions"][sBx + BX_BIAS]
            nups = function["flags"][0]
            names = []
            for capture in ins[pc + 1:pc + 1 + nups]:
                if capture[0] == MOVE:
                    name = name_at(capture[2], pc + nups + 1) or name_at(capture[2], pc)
                else:
                    name = f["upvalues"][capture[2]] if capture[2] < len(f["upvalues"]) else None
                if name is None:
                    raise Inconsistent("upvalue does not refer to a local")
                names.append(name)
            function["upvalues"] = names
            pc += nups
        pc += 1
    for function in f["functions"]:
        if len(function["upvalues"]) != function["flags"][0]:
            raise Inconsistent("function is never instantiated")
        annotate(function, counter)
