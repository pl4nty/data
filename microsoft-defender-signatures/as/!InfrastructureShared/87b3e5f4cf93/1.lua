-- Threat: !InfrastructureShared
-- Name: 87b3e5f4cf93
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil then
  TrackPidAndTechniqueBM(l_0_0.ppid, "T1218", "msdt_pcwdiag_source")
  local l_0_1 = MpCommon.ExpandEnvironmentVariables("%windir%\\system32\\sdiagnhost.exe")
  local l_0_2 = sysio.GetProcessFromFileName(l_0_1)
  if l_0_2 ~= nil and 0 < #l_0_2 then
    for l_0_3, l_0_4 in pairs(l_0_2) do
      local l_0_5 = string.format("pid:%d,ProcessStart:%u", l_0_4.pid, l_0_4.starttime)
      TrackPidAndTechniqueBM(l_0_5, "T1218", "msdt_pcwdiag_target")
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
