local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = "remote_file_created_taint"
L1_1 = "queue_pid_taintfactory_b"
L2_1 = nil
L3_1 = nil
L4_1 = nil
L5_1 = this_sigattrlog
L5_1 = L5_1[1]
L5_1 = L5_1.matched
if L5_1 then
  L5_1 = this_sigattrlog
  L5_1 = L5_1[1]
  L3_1 = L5_1.utf8p1
  L5_1 = this_sigattrlog
  L5_1 = L5_1[1]
  L2_1 = L5_1.utf8p2
  L5_1 = this_sigattrlog
  L5_1 = L5_1[1]
  L4_1 = L5_1.ppid
end
if not (L2_1 and L3_1) or not L4_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = IsKeyInRollingQueue
L6_1 = L1_1
L7_1 = L4_1
L8_1 = true
L5_1, L6_1 = L5_1(L6_1, L7_1, L8_1)
if not L5_1 then
  L7_1 = isTainted
  L8_1 = L2_1
  L9_1 = L0_1
  L7_1 = L7_1(L8_1, L9_1)
  if not L7_1 then
    goto lbl_45
  end
end
L7_1 = taint
L8_1 = L3_1
L9_1 = L0_1
L10_1 = 3600
L7_1(L8_1, L9_1, L10_1)
::lbl_45::
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
