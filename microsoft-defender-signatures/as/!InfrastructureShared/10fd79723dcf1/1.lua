-- Threat: !InfrastructureShared
-- Name: 10fd79723dcf1
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.ppid ~= nil then
  local l_0_1 = l_0_0.ppid
  local l_0_2 = string.lower(l_0_0.image_path)
  local l_0_3 = l_0_2:match("([^\\]+)$")
  local l_0_4 = {
    ["circuit.exe"] = true
  }
  if l_0_4[l_0_3] then
    return mp.CLEAN
  end
  if IsPidExcluded(l_0_1) then
    return mp.CLEAN
  end
  TrackPidAndTechnique(l_0_1, "T1021.006", "lolbin_wmic")
  if IsDetectionThresholdMet(l_0_1) then
    return mp.INFECTED
  end
  return mp.LOWFI
end
return mp.CLEAN
