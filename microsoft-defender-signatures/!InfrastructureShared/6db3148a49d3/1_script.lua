-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\6db3148a49d3\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1 = l_0_0.command_line
local l_0_2 = (bm.get_imagepath)()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = (bm.get_connection_string)()
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
local l_0_4 = (string.match)(l_0_3, "DestIp=([^;]*);")
if l_0_4 == nil or l_0_4 == "" then
  return mp.CLEAN
end
if not isPrivateIP(l_0_4) then
  return mp.CLEAN
end
local l_0_5 = (string.match)(l_0_3, "Uri=([^;]*);")
if l_0_5 == nil or l_0_5 == "" then
  return mp.CLEAN
end
local l_0_6 = (string.match)(l_0_5, "://([^/:]+)")
if l_0_6 == l_0_4 then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1071.001", "CommandAndControl_ApplicationLayerProtocol_WebProtocols")
return mp.INFECTED

