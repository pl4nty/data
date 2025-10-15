-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\252b31f188153\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = get_socket_fd_from_dup_event(this_sigattrlog[3])
local l_0_1 = get_socket_fd_from_dup_event(this_sigattrlog[4])
local l_0_2 = get_socket_fd_from_dup_event(this_sigattrlog[5])
if (l_0_0 ~= nil and l_0_0 == l_0_1 and l_0_1 == l_0_2) or l_0_1 == "0" and l_0_2 == "1" then
  return mp.INFECTED
end
return mp.CLEAN

