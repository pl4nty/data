local L0_1, L1_1, L2_1
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if 11 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if 8 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "SIGATTR:DelphiFile"
  L0_1 = L0_1(L1_1)
  if L0_1 then
    L0_1 = pe
    L0_1 = L0_1.set_peattribute
    L1_1 = "hstr_exhaustive"
    L2_1 = true
    L0_1(L1_1, L2_1)
    L0_1 = pe
    L0_1 = L0_1.reemulate
    L0_1()
    L0_1 = mp
    L0_1 = L0_1.SUSPICIOUS
    return L0_1
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
