local L0_1, L1_1
L0_1 = peattributes
L0_1 = L0_1.hasstandardentry
if L0_1 ~= true then
  L0_1 = pehdr
  L0_1 = L0_1.Subsystem
  if L0_1 ~= 1 then
    goto lbl_12
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_12::
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if 10 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.SUSPICIOUS
  return L0_1
end
L0_1 = hstrlog
L0_1 = L0_1[3]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = hstrlog
  L0_1 = L0_1[4]
  L0_1 = L0_1.matched
  if L0_1 then
    L0_1 = hstrlog
    L0_1 = L0_1[5]
    L0_1 = L0_1.matched
    if L0_1 then
      L0_1 = hstrlog
      L0_1 = L0_1[6]
      L0_1 = L0_1.matched
    end
  end
end
L1_1 = peattributes
L1_1 = L1_1.reads_vdll_code
if L1_1 and L0_1 then
  L1_1 = mp
  L1_1 = L1_1.LOWFI
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
