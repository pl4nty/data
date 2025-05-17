-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\62b3db77f7ab\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1 = l_0_0.command_line
local l_0_2 = (bm.get_imagepath)()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = (bm.get_connection_string)()
do
  if l_0_3 then
    local l_0_4 = tonumber((string.match)(l_0_3, "DestPort=(%d+)"))
    if l_0_4 ~= nil and l_0_4 ~= "" and l_0_4 ~= 8080 and l_0_4 >= 5000 then
      TrackPidAndTechniqueBM("BM", "T1572", "CommandAndControl_ProtocolTunneling_HTTPoverNonStandardPort.A")
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

