-- Threat: !InfrastructureShared
-- Name: 2beb37aab8eaa
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = get_socket_fd_from_dup_event(this_sigattrlog[2])
local l_0_1 = get_socket_fd_from_dup_event(this_sigattrlog[3])
local l_0_2 = get_socket_fd_from_dup_event(this_sigattrlog[4])
if verify_socket_fd_triplet(l_0_0, l_0_1, l_0_2) then
  return mp.INFECTED
end
return mp.CLEAN
