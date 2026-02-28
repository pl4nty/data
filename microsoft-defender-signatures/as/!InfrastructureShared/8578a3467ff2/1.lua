local L0_1, L1_1, L2_1
L0_1 = mp
L0_1 = L0_1.GetHSTRCallerId
L0_1 = L0_1()
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.HSTR_CALLER_SMS
  if L1_1 == L0_1 then
    goto lbl_16
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_16::
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
