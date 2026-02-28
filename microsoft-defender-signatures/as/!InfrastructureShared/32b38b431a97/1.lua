local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p2
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.utf8p2
    if not L2_1 then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
    L3_1 = MpCommon
    L3_1 = L3_1.StringRegExpSearch
    L4_1 = "(?i)binPath=[\\s'\\\"\\\\]+(.*\\.\\w+)"
    L5_1 = L2_1
    L3_1, L4_1 = L3_1(L4_1, L5_1)
    L0_1 = L4_1
    _ = L3_1
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    L4_1 = L3_1
    L3_1 = L3_1.match
    L5_1 = "create(.*)binpath"
    L3_1 = L3_1(L4_1, L5_1)
    L1_1 = L3_1
  end
end
if not L0_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = AppendToRollingQueue
L3_1 = "NewlyRegisteredServices"
L4_1 = L0_1
L5_1 = true
L6_1 = 3600
L7_1 = 20
L2_1(L3_1, L4_1, L5_1, L6_1, L7_1)
if L1_1 then
  L2_1 = AppendToRollingQueue
  L3_1 = "NewlyRegisteredServices_Name"
  L4_1 = L1_1
  L5_1 = true
  L6_1 = 3600
  L7_1 = 20
  L2_1(L3_1, L4_1, L5_1, L6_1, L7_1)
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
