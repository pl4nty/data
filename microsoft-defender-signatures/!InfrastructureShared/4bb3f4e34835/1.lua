-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4bb3f4e34835\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (string.lower)((bm.get_imagepath)())
if l_0_0 and ((string.find)(l_0_0, "\\program files", 1, true) or (string.find)(l_0_0, "\\xcopy.exe", 1, true)) then
  return mp.CLEAN
end
local l_0_1 = (bm.get_current_process_startup_info)()
if not IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_1.ppid, true) then
  AppendToRollingQueue("IsProcessChainViaRUNMRU", l_0_1.ppid, 1, 30)
end
return mp.INFECTED

