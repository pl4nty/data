-- Threat: !InfrastructureShared
-- Name: 155d72b23430f
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  local l_0_2 = l_0_1:match("([^\\]+)$")
  local l_0_3 = {
    ["sdiagnhost.exe"] = true,
    ["qualysagent.exe"] = true,
    ["pulsesecureservice.exe"] = true,
    ["javaw.exe"] = true,
    ["java.exe"] = true,
    ["ruby.exe"] = true,
    ["logmein.exe"] = true,
    ["fasm.exe"] = true,
    ["911 location manager.exe"] = true,
    ["ltsvc.exe"] = true,
    ["jumpcloud-agent.exe"] = true,
    ["vmtoolsd.exe"] = true,
    ["podman desktop.exe"] = true
  }
  if l_0_3[l_0_2] then
    return mp.CLEAN
  end
end
TrackPidAndTechnique("CMDHSTR", "T1047", "windows_management_instrumentation")
if IsDetectionThresholdMet("CMDHSTR") then
  return mp.INFECTED
end
return mp.LOWFI
