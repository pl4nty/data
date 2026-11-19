-- Threat: !InfrastructureShared
-- Name: 106b3b46ec3ef
-- Type: 21
-- Includes: TechniqueTracker, LuaFuncHelper

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0.command_line == nil or l_0_0.image_path == nil then
  return mp.CLEAN
end
if this_sigattrlog[8].matched and this_sigattrlog[8].utf8p2 ~= nil then
  local l_0_1 = this_sigattrlog[8].utf8p2:match("attacksvr:([^;]+);?")
  local l_0_2 = ExtractPartsFromUri(l_0_1)
  if l_0_2.host == nil or l_0_2.host == "" then
    return mp.CLEAN
  end
  if IsHostAttackServerCloudChk(l_0_2.host, "Behavior:Win32/ActiveConnToAttackerServer.H!blk", l_0_0.image_path, l_0_0.command_line, "MOTW") then
    TrackPidAndTechniqueBM(l_0_0.ppid, l_0_2.host, "FirewallBlock")
    return mp.INFECTED
  end
end
return mp.CLEAN
