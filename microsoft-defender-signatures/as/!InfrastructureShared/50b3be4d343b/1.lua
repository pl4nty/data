-- Threat: !InfrastructureShared
-- Name: 50b3be4d343b
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
end
if l_0_0:sub(1, 2) == "\\\\" or l_0_0:sub(1, 3) == "\"\\\\" or l_0_0:sub(1, 3) == "'\\\\" then
  if l_0_0:find("\\sysvol", 1, true) or l_0_0:find("\\netlogon", 1, true) or l_0_0:find("\\ccm", 1, true) or l_0_0:find("\\sccm", 1, true) then
    return mp.CLEAN
  end
  local l_0_1 = bm.get_current_process_startup_info()
  if l_0_1 == nil or l_0_1.command_line == nil or l_0_1.image_path == nil then
    return mp.CLEAN
  end
  if IsHostAttackServerCloudChk(l_0_0, "Behavior:Win32/XferFromAttackerServer.B", l_0_1.image_path, l_0_1.command_line, "SMBCopyToShare") then
    bm_AddRelatedFileFromCommandLine(this_sigattrlog[1].utf8p2, nil, nil, 6)
    TrackPidAndTechniqueBM(this_sigattrlog[1].ppid, "T1057", "xfer_from_attackerserver_b")
    return mp.INFECTED
  end
end
return mp.CLEAN
