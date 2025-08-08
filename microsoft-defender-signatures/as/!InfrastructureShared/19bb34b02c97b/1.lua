-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\19bb34b02c97b\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
local l_0_1 = (bm.get_current_process_startup_info)()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_1.command_line
if not IsExcludedByCmdlineMacOS(l_0_2) and not IsExcludedByImagePathMacOS(l_0_0) then
  return mp.INFECTED
end
return mp.CLEAN

