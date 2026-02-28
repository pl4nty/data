local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = get_socket_fd_from_dup_event
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L0_1 = L0_1(L1_1)
L1_1 = get_socket_fd_from_dup_event
L2_1 = this_sigattrlog
L2_1 = L2_1[3]
L1_1 = L1_1(L2_1)
L2_1 = get_socket_fd_from_dup_event
L3_1 = this_sigattrlog
L3_1 = L3_1[4]
L2_1 = L2_1(L3_1)
L3_1 = verify_socket_fd_triplet
L4_1 = L0_1
L5_1 = L1_1
L6_1 = L2_1
L3_1 = L3_1(L4_1, L5_1, L6_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
