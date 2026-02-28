local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
if L0_1 ~= nil then
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_TRUSTCHECK
  if L0_1 == L1_1 then
    goto lbl_15
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_15::
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = 42
L1_1 = L1_1(L2_1)
L2_1 = crypto
L2_1 = L2_1.bitand
L3_1 = L1_1
L4_1 = 2
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == 2 then
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.IsTrustedFile
L3_1 = false
L2_1 = L2_1(L3_1)
if L2_1 == false then
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
