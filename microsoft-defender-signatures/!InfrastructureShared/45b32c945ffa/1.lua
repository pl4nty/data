-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\45b32c945ffa\1.luac 

-- params : ...
-- function num : 0
if (bm.GetSignatureMatchDuration)() > 100000000 then
  return mp.CLEAN
end
local l_0_0 = (bm.get_connection_string)()
if l_0_0 then
  local l_0_1 = (bm.get_current_process_startup_info)()
  if l_0_1 == nil or l_0_1.command_line == nil or l_0_1.image_path == nil then
    return mp.CLEAN
  end
  local l_0_2 = (string.match)(l_0_0, "DestIp=([^;]+)")
  if not l_0_2 then
    return mp.CLEAN
  end
  if IsHostAttackServerCloudChk(l_0_2, "Behavior:Win32/ActiveConnToAttackerServer.I", l_0_1.image_path, l_0_1.command_line, "ActiveConnToAttackerServer") then
    TrackPidAndTechniqueBM("BM", "T1020", "active_attacker_server_connection_i;attacksvr:" .. l_0_2)
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

