-- Threat: !InfrastructureShared
-- Name: ddd7f90a4016
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = GetRealPidForScenario("CMDHSTR")
if IsPidExcluded(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = mp.GetParentProcInfo()
if l_0_1 ~= nil and l_0_1.image_path ~= nil then
  local l_0_2 = l_0_1.image_path
  local l_0_3 = string.lower(l_0_2:match("([^\\]+)$"))
  local l_0_4 = {
    ["ccmexec.exe"] = true,
    ["gpscript.exe"] = true,
    ["mpcmdrun.exe"] = true,
    ["mssense.exe"] = true,
    ["senseir.exe"] = true
  }
  if l_0_4[l_0_3] then
    return mp.CLEAN
  end
end
TrackPidAndTechnique(l_0_0, "T1003", "shadowcopy_create")
if IsDetectionThresholdMet(l_0_0) then
  return mp.INFECTED
end
return mp.LOWFI
