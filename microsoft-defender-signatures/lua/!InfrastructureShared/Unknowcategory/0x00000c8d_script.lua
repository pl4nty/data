-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00000c8d_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1 = l_0_0.command_line
if (string.find)(l_0_1, " -l ", 1, true) and (string.find)(l_0_1, " -p ", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN

