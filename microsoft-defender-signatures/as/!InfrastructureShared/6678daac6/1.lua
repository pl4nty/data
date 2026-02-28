local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if 3 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
else
  L0_1 = mp
  L0_1 = L0_1.HSTR_WEIGHT
  if L0_1 == 2 then
    L0_1 = mp
    L0_1 = L0_1.set_mpattribute
    L1_1 = "HSTR:Win32/Obfuscator_Upatre_Dyzap_1"
    L0_1(L1_1)
  else
    L0_1 = hstrlog
    L0_1 = L0_1[3]
    L0_1 = L0_1.matched
    if L0_1 then
      L0_1 = mp
      L0_1 = L0_1.set_mpattribute
      L1_1 = "HSTR:Win32/Obfuscator_Upatre_Dyzap_2"
      L0_1(L1_1)
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
