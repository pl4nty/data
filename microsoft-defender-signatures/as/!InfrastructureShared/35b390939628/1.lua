-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\35b390939628\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = nil
local l_0_1 = nil
if (bm.get_current_process_startup_info)() ~= nil then
  l_0_1 = ((bm.get_current_process_startup_info)()).ppid
end
if l_0_1 ~= nil then
  TrackPidAndTechniqueBM(l_0_1, "T1027", "tt-thresholdmet")
end
return mp.INFECTED

