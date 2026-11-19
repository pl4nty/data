-- Threat: !InfrastructureShared
-- Name: 60b30ee75626
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0.command_line == nil or l_0_0.image_path == nil then
  return mp.CLEAN
end
if l_0_0.ppid and l_0_0.command_line then
  local l_0_1 = string.lower(l_0_0.command_line)
  for l_0_2 in l_0_1:gmatch("(https?://[^%s]+)") do
    if IsHostAttackServerCloudChk(l_0_2, "Behavior:Win32/XferFromAttackerServer.A", l_0_0.image_path, l_0_0.command_line, "UrlInCmdline") then
      TrackPidAndTechniqueBM(l_0_0.ppid, "T1057", "xfer_from_attackerserver_a")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
