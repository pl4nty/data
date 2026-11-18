-- Threat: !InfrastructureShared
-- Name: b5d780b964f5
-- Type: 21
-- Includes: TechniqueTracker, ResearchData

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 then
  local l_0_1 = l_0_0.image_path
  if l_0_1 == nil then
    return mp.CLEAN
  end
  l_0_1 = string.lower(l_0_1)
  if checkFileLastWriteTime(l_0_1, 120) ~= false then
    return mp.CLEAN
  end
  if mp.IsKnownFriendlyFile(l_0_1, true, false) == true then
    return mp.CLEAN
  end
  set_research_data("ParentInfo", MpCommon.Base64Encode(l_0_1), false)
  return mp.INFECTED
end
return mp.CLEAN
