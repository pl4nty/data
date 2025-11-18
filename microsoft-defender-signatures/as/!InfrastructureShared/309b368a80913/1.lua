-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\309b368a80913\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = get_socket_fd_from_dup_event(this_sigattrlog[4])
local l_0_1 = get_socket_fd_from_dup_event(this_sigattrlog[5])
if verify_socket_fd_pair(l_0_0, l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN

