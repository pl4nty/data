local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 ~= L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_NEWLYCREATEDHINT
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = string
L0_1 = L0_1.lower
L1_1 = string
L1_1 = L1_1.sub
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_FILENAME
L2_1 = L2_1(L3_1)
L3_1 = -3
L1_1, L2_1, L3_1, L4_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1)
if L0_1 ~= ".vm" then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = string
L0_1 = L0_1.find
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_FILEPATH
L2_1, L3_1, L4_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1)
L2_1 = "atlassian\\confluence\\extra\\widgetconnector\\templates"
L3_1 = 1
L4_1 = true
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilename
L0_1 = L0_1()
L1_1 = MpCommon
L1_1 = L1_1.QueryPersistContext
L2_1 = L0_1
L3_1 = "DroppedSuspVMTemplate"
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L1_1 = MpCommon
  L1_1 = L1_1.AppendPersistContext
  L2_1 = L0_1
  L3_1 = "DroppedSuspVMTemplate"
  L4_1 = 0
  L1_1(L2_1, L3_1, L4_1)
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
