-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\f7b33d92b788\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if is_valid_ip(l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN

