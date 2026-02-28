local L0_1, L1_1, L2_1
L0_1 = mp
L0_1 = L0_1.GetHSTRCallerId
L0_1 = L0_1()
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.HSTR_CALLER_SMS
if L1_1 == L0_1 then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.set_mpattribute
L2_1 = "SLF:Trojan:Win32/SusBrc4.D"
L1_1(L2_1)
L1_1 = mp
L1_1 = L1_1.LOWFI
return L1_1
