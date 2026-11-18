-- Threat: !InfrastructureShared
-- Name: 309b368a80913
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = get_socket_fd_from_dup_event(this_sigattrlog[4])
local l_0_1 = get_socket_fd_from_dup_event(this_sigattrlog[5])
if verify_socket_fd_pair(l_0_0, l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN
