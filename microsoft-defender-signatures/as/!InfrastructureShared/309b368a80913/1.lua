local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = get_socket_fd_from_dup_event
L1_1 = this_sigattrlog
L1_1 = L1_1[4]
L0_1 = L0_1(L1_1)
L1_1 = get_socket_fd_from_dup_event
L2_1 = this_sigattrlog
L2_1 = L2_1[5]
L1_1 = L1_1(L2_1)
L2_1 = verify_socket_fd_pair
L3_1 = L0_1
L4_1 = L1_1
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
