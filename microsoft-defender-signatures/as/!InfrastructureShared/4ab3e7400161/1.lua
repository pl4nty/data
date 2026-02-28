local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = bm
L0_1 = L0_1.get_imagepath
L0_1 = L0_1()
L1_1 = nil
L2_1 = nil
L3_1 = nil
L4_1 = this_sigattrlog
L4_1 = L4_1[2]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[2]
  L4_1 = L4_1.utf8p1
  if L4_1 ~= nil then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[2]
    L2_1 = L4_1.utf8p1
    L4_1 = this_sigattrlog
    L4_1 = L4_1[2]
    L3_1 = L4_1.ppid
  end
end
L4_1 = {}
L5_1 = "/curl"
L6_1 = "/wget"
L4_1[1] = L5_1
L4_1[2] = L6_1
L5_1 = ipairs
L6_1 = L4_1
L5_1, L6_1, L7_1 = L5_1(L6_1)
for L8_1, L9_1 in L5_1, L6_1, L7_1 do
  L11_1 = L0_1
  L10_1 = L0_1.sub
  L12_1 = #L9_1
  L12_1 = -L12_1
  L10_1 = L10_1(L11_1, L12_1)
  if L10_1 == L9_1 then
    L10_1 = mp
    L10_1 = L10_1.CLEAN
    return L10_1
  end
end
L5_1 = taint
L6_1 = L2_1
L7_1 = "remote_file_created_taint"
L8_1 = 3600
L5_1(L6_1, L7_1, L8_1)
L5_1 = AppendToRollingQueue
L6_1 = "queue_pid_taintfactory_a"
L7_1 = L3_1
L8_1 = 1
L9_1 = 600
L5_1(L6_1, L7_1, L8_1, L9_1)
L5_1 = bm
L5_1 = L5_1.get_process_relationships
L5_1, L6_1 = L5_1()
_ = L6_1
L1_1 = L5_1
L5_1 = ipairs
L6_1 = L1_1
L5_1, L6_1, L7_1 = L5_1(L6_1)
for L8_1, L9_1 in L5_1, L6_1, L7_1 do
  L10_1 = mp
  L10_1 = L10_1.bitand
  L11_1 = L9_1.reason_ex
  L12_1 = 1
  L10_1 = L10_1(L11_1, L12_1)
  if L10_1 == 1 then
    L10_1 = bm
    L10_1 = L10_1.add_related_file
    L11_1 = L9_1.image_path
    L10_1(L11_1)
    L10_1 = bm
    L10_1 = L10_1.add_related_process
    L11_1 = L9_1.ppid
    L10_1(L11_1)
    L10_1 = TrackPidAndTechniqueBM
    L11_1 = L9_1.ppid
    L12_1 = "T1036.003"
    L13_1 = "DefenseEvasion"
    L10_1(L11_1, L12_1, L13_1)
    L10_1 = mp
    L10_1 = L10_1.INFECTED
    return L10_1
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
