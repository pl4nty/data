local L0_1, L1_1, L2_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "SIGATTR:Backdoor:Win32/Delfdoorlib"
L0_1 = L0_1(L1_1)
if L0_1 == false then
  L0_1 = mp
  L0_1 = L0_1.LOWFI
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if 3 <= L0_1 then
  L0_1 = pe
  L0_1 = L0_1.query_import
  L1_1 = pe
  L1_1 = L1_1.IMPORT_STATIC
  L2_1 = 2946926388
  L0_1 = L0_1(L1_1, L2_1)
  if L0_1 then
    L0_1 = mp
    L0_1 = L0_1.INFECTED
    return L0_1
  end
end
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if 2 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "SIGATTR:ASEP"
  L0_1 = L0_1(L1_1)
  if L0_1 then
    L0_1 = mp
    L0_1 = L0_1.INFECTED
    return L0_1
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
