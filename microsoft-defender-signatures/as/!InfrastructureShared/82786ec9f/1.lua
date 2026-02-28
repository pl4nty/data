local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if 14 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if 4 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "SIGATTR:MadCodeHook"
  L0_1 = L0_1(L1_1)
  if L0_1 then
    L0_1 = mp
    L0_1 = L0_1.set_mpattribute
    L1_1 = "do_exhaustivehstr_rescan"
    L0_1(L1_1)
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
