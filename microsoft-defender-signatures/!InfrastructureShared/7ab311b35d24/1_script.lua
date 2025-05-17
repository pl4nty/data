-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\7ab311b35d24\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
if (string.match)(l_0_1, "[^ ]+%s->%s-\\\\%.\\pipe\\[^ ]+$") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN

