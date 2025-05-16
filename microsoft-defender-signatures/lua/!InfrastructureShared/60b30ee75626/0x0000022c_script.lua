-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\60b30ee75626\0x0000022c_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil or l_0_0.command_line == nil or l_0_0.image_path == nil then
  return mp.CLEAN
end
if l_0_0.ppid and l_0_0.command_line then
  local l_0_1 = (string.lower)(l_0_0.command_line)
  for l_0_5 in l_0_1:gmatch("(https?://[^%s]+)") do
    if IsHostAttackServerCloudChk(l_0_5, "Behavior:Win32/XferFromAttackerServer.A", l_0_0.image_path, l_0_0.command_line, "UrlInCmdline") then
      TrackPidAndTechniqueBM(l_0_0.ppid, "T1057", "xfer_from_attackerserver_a")
      return mp.INFECTED
    end
  end
end
do
  l_0_1 = mp
  l_0_1 = l_0_1.CLEAN
  return l_0_1
end

