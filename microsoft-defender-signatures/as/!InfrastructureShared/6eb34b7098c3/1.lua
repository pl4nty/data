-- Threat: !InfrastructureShared
-- Name: 6eb34b7098c3
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
end
if l_0_0 and (l_0_0:sub(1, 2) == "\\\\" or l_0_0:sub(1, 3) == "\"\\\\" or l_0_0:sub(1, 3) == "'\\\\") then
  local l_0_1 = bm.get_current_process_startup_info()
  if l_0_1 == nil or l_0_1.command_line == nil or l_0_1.image_path == nil then
    return mp.CLEAN
  end
  if IsHostAttackServerCloudChk(l_0_0, "Behavior:Win32/XferToAttackerServer.A", l_0_1.image_path, l_0_1.command_line, "SMBCopyToShare") then
    TrackPidAndTechniqueBM("BM", "T1057", "xfer_to_attackerserver_a")
    return mp.INFECTED
  end
end
return mp.CLEAN
