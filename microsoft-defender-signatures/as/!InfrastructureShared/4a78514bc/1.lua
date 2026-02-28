local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if 3 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = hstrlog
L0_1 = L0_1[3]
L0_1 = L0_1.matched
if not L0_1 then
  L0_1 = hstrlog
  L0_1 = L0_1[4]
  L0_1 = L0_1.matched
  if not L0_1 then
    goto lbl_27
  end
end
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "pea_genpacked"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
::lbl_27::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
