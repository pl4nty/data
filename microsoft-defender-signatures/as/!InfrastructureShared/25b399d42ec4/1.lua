-- Threat: !InfrastructureShared
-- Name: 25b399d42ec4
-- Type: 21
-- Includes: BMLuaLib

if versioning.GetEngineBuild() < 16700 then
  return mp.CLEAN
end
local l_0_0 = versioning.GetOrgID()
if isnull(l_0_0) then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_1 = false
if l_0_0 == "d7c7c745-195f-4223-9c7a-99fb420fd000" or l_0_0 == "c34db763-35fc-4c4a-9ca4-697338808f18" then
  l_0_1 = true
elseif versioning.IsSampled(40000, false, true, true) == true then
  l_0_1 = true
end
if l_0_1 == false then
  return mp.CLEAN
end
if not mp.IsHipsRuleEnabled("9e6c4e1f-7d60-472f-ba1a-a39ef669e4b2") then
  return mp.CLEAN
end
local l_0_2 = bm.get_imagepath()
if isnull(l_0_2) then
  return mp.CLEAN
end
l_0_2 = MpCommon.PathToWin32Path(l_0_2)
if isnull(l_0_2) then
  return mp.CLEAN
end
l_0_2 = string.lower(l_0_2)
if mp.IsPathExcludedForHipsRule(l_0_2, "9e6c4e1f-7d60-472f-ba1a-a39ef669e4b2") then
  return mp.INFECTED
end
return mp.CLEAN
