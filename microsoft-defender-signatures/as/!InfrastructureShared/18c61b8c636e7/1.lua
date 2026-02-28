local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.GetHSTRCallerId
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = mp
  L1_1 = L1_1.HSTR_CALLER_SMS
  if L1_1 == L0_1 then
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.LOWFI
return L1_1
