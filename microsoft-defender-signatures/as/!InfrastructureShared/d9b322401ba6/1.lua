-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d9b322401ba6\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
if l_0_1 == nil or l_0_1 == "" or IsExcludedByCmdlineMacOS(l_0_1) then
  return mp.CLEAN
end
return mp.INFECTED

