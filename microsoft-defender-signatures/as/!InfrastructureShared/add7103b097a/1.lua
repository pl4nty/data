-- Threat: !InfrastructureShared
-- Name: add7103b097a
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if l_0_1 == nil then
    return mp.CLEAN
  end
  local l_0_2 = l_0_1:match("([^\\]+)$")
  local l_0_3 = {
    ["springtoolsuite4.exe"] = true,
    ["microsoft.servicehub.controller.exe"] = true,
    ["devenv.exe"] = true,
    ["amazon-ssm-agent.exe"] = true,
    ["te-updater.exe"] = true,
    ["te-proxy.exe"] = true,
    ["te-iehelper.exe"] = true,
    ["gotoassistui.exe"] = true,
    ["gotoassistservice.exe"] = true,
    ["idea64.exe"] = true,
    ["te-user-agent.exe"] = true,
    ["monitoringhost.exe"] = true,
    ["qq.exe"] = true
  }
  if l_0_3[l_0_2] then
    return mp.CLEAN
  end
end
TrackPidAndTechnique("CMDHSTR", "T1033", "session_discovery")
if IsDetectionThresholdMet("CMDHSTR") then
  return mp.LOWFI
end
return mp.CLEAN
