-- Threat: !InfrastructureShared
-- Name: 175b317beb065
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil then
  local l_0_1 = l_0_0.command_line
  if l_0_1 == nil or l_0_1 == "" then
    return mp.CLEAN
  end
  if 7000 <= #l_0_1 then
    bm.trigger_sig("SuspiciousCommandline.A", "Detected")
    TrackPidAndTechniqueBM("BM", "T1059", "SuspiciousCommandline")
    return mp.INFECTED
  end
end
return mp.CLEAN
