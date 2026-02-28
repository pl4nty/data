local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = versioning
L0_1 = L0_1.GetEngineBuild
L0_1 = L0_1()
if L0_1 < 16700 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = versioning
L0_1 = L0_1.GetOrgID
L0_1 = L0_1()
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L1_1 = false
if L0_1 == "d7c7c745-195f-4223-9c7a-99fb420fd000" or L0_1 == "c34db763-35fc-4c4a-9ca4-697338808f18" then
  L1_1 = true
else
  L2_1 = MpCommon
  L2_1 = L2_1.IsSampled
  L3_1 = 40000
  L4_1 = false
  L5_1 = true
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 == true then
    L1_1 = true
  end
end
if L1_1 == false then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.IsHipsRuleEnabled
L3_1 = "9e6c4e1f-7d60-472f-ba1a-a39ef669e4b2"
L2_1 = L2_1(L3_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = bm
L2_1 = L2_1.get_imagepath
L2_1 = L2_1()
L3_1 = isnull
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = MpCommon
L3_1 = L3_1.PathToWin32Path
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L2_1 = L3_1
L3_1 = isnull
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L2_1 = L3_1
L3_1 = mp
L3_1 = L3_1.IsPathExcludedForHipsRule
L4_1 = L2_1
L5_1 = "9e6c4e1f-7d60-472f-ba1a-a39ef669e4b2"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
