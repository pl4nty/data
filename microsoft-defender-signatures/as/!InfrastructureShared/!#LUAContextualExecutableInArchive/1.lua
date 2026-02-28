local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.IsHipsRuleEnabled
L1_1 = "be9ba2d9-53ea-4cdc-84e5-9b1eeee46550"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FNAME
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1)
L1_1 = string
L1_1 = L1_1.len
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 < 4 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.sub
L2_1 = L0_1
L3_1 = -4
L1_1 = L1_1(L2_1, L3_1)
L2_1 = L1_1
L1_1 = L1_1.match
L3_1 = "%.(%w+)$"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = IsSuspiciousFileExt
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "MpDisableCaching"
  L2_1(L3_1)
  L2_1 = "enghipscpy:blockaccess:be9ba2d9-53ea-4cdc-84e5-9b1eeee46550"
  L3_1 = MpCommon
  L3_1 = L3_1.QueryPersistContext
  L4_1 = mp
  L4_1 = L4_1.getfilename
  L4_1 = L4_1()
  L5_1 = L2_1
  L3_1 = L3_1(L4_1, L5_1)
  if not L3_1 then
    L3_1 = MpCommon
    L3_1 = L3_1.AppendPersistContext
    L4_1 = mp
    L4_1 = L4_1.getfilename
    L4_1 = L4_1()
    L5_1 = L2_1
    L6_1 = 0
    L3_1(L4_1, L5_1, L6_1)
  end
  L3_1 = mp
  L3_1 = L3_1.SetHipsRule
  L4_1 = "be9ba2d9-53ea-4cdc-84e5-9b1eeee46550"
  L3_1(L4_1)
  L3_1 = mp
  L3_1 = L3_1.BLOCKACCESS
  return L3_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
