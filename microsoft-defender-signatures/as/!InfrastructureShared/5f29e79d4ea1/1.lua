local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "MpIsPowerShellAMSIScan"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.set_mpattribute
L1_1 = "SuspTamperingScript"
L0_1(L1_1)
L0_1 = isTamperProtectionOn
L0_1 = L0_1()
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = MpCommon
L0_1 = L0_1.NidSearch
L1_1 = mp
L1_1 = L1_1.NID_ENABLE_EXTENDED_BAFS
L2_1 = 3
L0_1 = L0_1(L1_1, L2_1)
if L0_1 then
  L0_1 = set_research_data
  L1_1 = "Reason"
  L2_1 = "AggressivePeTrigger"
  L3_1 = false
  L0_1(L1_1, L2_1, L3_1)
  L0_1 = mp
  L0_1 = L0_1.LOWFI
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
