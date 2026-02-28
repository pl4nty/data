local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = "remote_file_created_taint"
L1_1 = "queue_pid_taintfactory_a"
L2_1 = nil
L3_1 = nil
L4_1 = this_sigattrlog
L4_1 = L4_1[1]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[1]
  L2_1 = L4_1.utf8p1
  L4_1 = this_sigattrlog
  L4_1 = L4_1[1]
  L3_1 = L4_1.ppid
end
if not L2_1 or not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = IsKeyInRollingQueue
L5_1 = L1_1
L6_1 = L3_1
L7_1 = true
L4_1, L5_1 = L4_1(L5_1, L6_1, L7_1)
if L4_1 then
  L6_1 = taint
  L7_1 = L2_1
  L8_1 = L0_1
  L9_1 = 3600
  L6_1(L7_1, L8_1, L9_1)
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
