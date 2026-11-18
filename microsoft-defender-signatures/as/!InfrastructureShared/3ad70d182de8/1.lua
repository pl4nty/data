-- Threat: !InfrastructureShared
-- Name: 3ad70d182de8
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetScannedPPID()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if string.find(l_0_1:lower(), "\226\128\174", 1, true) then
  local l_0_2 = mp.GetParentProcInfo()
  if l_0_2 then
    local l_0_3 = l_0_2.image_path
    if l_0_3 == nil then
      return mp.CLEAN
    end
    l_0_3 = string.lower(l_0_3)
    if checkFileLastWriteTime(l_0_3, 120) ~= false then
      return mp.CLEAN
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
