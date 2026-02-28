local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = tostring
L1_1 = headerpage
L0_1 = L0_1(L1_1)
L1_1 = tostring
L2_1 = footerpage
L1_1 = L1_1(L2_1)
L0_1 = L0_1 .. L1_1
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L1_1 = string
L1_1 = L1_1.match
L2_1 = L0_1
L3_1 = "set%-applockerpolicy%s+%-xmlpolicy%s+(.-%.xml)"
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L1_1 = ""
end
L3_1 = L1_1
L2_1 = L1_1.gsub
L4_1 = "'"
L5_1 = ""
L2_1 = L2_1(L3_1, L4_1, L5_1)
L1_1 = L2_1
L3_1 = L1_1
L2_1 = L1_1.gsub
L4_1 = "\""
L5_1 = ""
L2_1 = L2_1(L3_1, L4_1, L5_1)
L1_1 = L2_1
L3_1 = L1_1
L2_1 = L1_1.gsub
L4_1 = "^%.\\"
L5_1 = ""
L2_1 = L2_1(L3_1, L4_1, L5_1)
L1_1 = L2_1
L3_1 = L1_1
L2_1 = L1_1.gsub
L4_1 = "([%^%$%(%)%.%[%]%*%+%-%?])"
L5_1 = "\\%1"
L2_1 = L2_1(L3_1, L4_1, L5_1)
L3_1 = pcall
L4_1 = MpCommon
L4_1 = L4_1.RollingQueueQueryKeyRegex
L5_1 = "RQ_RecentAppLockerPolicyFileDropped"
L6_1 = L2_1
L3_1, L4_1 = L3_1(L4_1, L5_1, L6_1)
if L3_1 and L4_1 then
  L5_1 = set_research_data
  L6_1 = "PolicyFile"
  L7_1 = MpCommon
  L7_1 = L7_1.Base64Encode
  L8_1 = L1_1
  L9_1 = "|"
  L10_1 = L4_1
  L8_1 = L8_1 .. L9_1 .. L10_1
  L7_1 = L7_1(L8_1)
  L8_1 = false
  L5_1(L6_1, L7_1, L8_1)
  L5_1 = {}
  L5_1.policyFile = L1_1
  L5_1.Condition = L4_1
  L6_1 = add_parents_AMSI
  L6_1 = L6_1()
  L5_1.parents = L6_1
  L6_1 = safeJsonSerialize
  L7_1 = L5_1
  L8_1 = 150
  L9_1 = nil
  L10_1 = true
  L6_1, L7_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
  if L6_1 then
    L8_1 = mp
    L8_1 = L8_1.get_contextdata
    L9_1 = mp
    L9_1 = L9_1.CONTEXT_DATA_AMSI_OPERATION_PPID
    L8_1 = L8_1(L9_1)
    if L8_1 then
      L9_1 = MpCommon
      L9_1 = L9_1.BmTriggerSig
      L10_1 = L8_1
      L11_1 = "LuaAppLockerMDE"
      L12_1 = safeJsonSerialize
      L13_1 = L6_1
      L12_1, L13_1 = L12_1(L13_1)
      L9_1(L10_1, L11_1, L12_1, L13_1)
    end
  end
  L8_1 = mp
  L8_1 = L8_1.INFECTED
  return L8_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
