-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\1d6_482.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1 = l_0_0.command_line
if l_0_1 then
  l_0_1 = (string.gsub)(l_0_1, "\"", "")
  l_0_1 = (string.gsub)(l_0_1, "\'", "")
  l_0_1 = (string.lower)(l_0_1)
  if (string.find)(l_0_1, "http.- # ") or (string.find)(l_0_1, " �[\128-�][\128-�] ") or (string.find)(l_0_1, " �[\128-�][\128-�][\128-�] ") then
    return mp.INFECTED
  end
end
return mp.CLEAN

