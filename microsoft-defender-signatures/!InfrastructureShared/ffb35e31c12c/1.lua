-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\ffb35e31c12c\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1 = l_0_0.command_line
local l_0_2 = (string.lower)((bm.get_imagepath)())
if l_0_1 == nil or l_0_1 == "" or l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
if not IsExcludedByCmdlineMacOS(l_0_1) or not IsExcludedByImagePathMacOS(l_0_2) then
  return mp.INFECTED
end
return mp.CLEAN

