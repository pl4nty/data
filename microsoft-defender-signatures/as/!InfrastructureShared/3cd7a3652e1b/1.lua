-- Threat: !InfrastructureShared
-- Name: 3cd7a3652e1b
-- Type: 21
-- Includes: TechniqueTracker

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
  return mp.INFECTED
end
return mp.CLEAN
