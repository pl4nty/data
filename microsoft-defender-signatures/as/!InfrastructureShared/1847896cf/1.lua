local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if L0_1 == 5 then
  L0_1 = mp
  L0_1 = L0_1.set_mpattribute
  L1_1 = "do_exhaustivehstr_rescan`"
  L0_1(L1_1)
  L0_1 = pe
  L0_1 = L0_1.reemulate
  L0_1()
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = hstrlog
L0_1 = L0_1[14]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.changedetectionname
  L1_1 = 805306379
  L0_1(L1_1)
else
  L0_1 = hstrlog
  L0_1 = L0_1[11]
  L0_1 = L0_1.matched
  if L0_1 then
    L0_1 = mp
    L0_1 = L0_1.changedetectionname
    L1_1 = 805306380
    L0_1(L1_1)
  end
end
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
