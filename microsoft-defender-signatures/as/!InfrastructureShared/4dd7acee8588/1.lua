-- Threat: !InfrastructureShared
-- Name: 4dd7acee8588
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = {
  ["node.exe"] = true,
  ["masvc.exe"] = true,
  ["ltsvc.exe"] = true,
  ["java.exe"] = true
}
local l_0_1 = mp.GetParentProcInfo()
if l_0_1 ~= nil then
  local l_0_2 = string.lower(l_0_1.image_path)
  if l_0_2 ~= nil then
    local l_0_3 = l_0_2:match("([^\\]+)$")
    if l_0_0[l_0_3] then
      return mp.CLEAN
    end
  end
end
TrackPidAndTechnique("CMDHSTR", "T1057", "process_discovery")
if IsDetectionThresholdMet("CMDHSTR") then
  return mp.LOWFI
end
return mp.CLEAN
