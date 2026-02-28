local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1
L0_1 = bm
L0_1 = L0_1.get_imagepath
L0_1 = L0_1()
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()
L2_1 = L1_1.command_line
L3_1 = nil
L4_1 = nil
L5_1 = nil
L6_1 = nil
L7_1 = this_sigattrlog
L7_1 = L7_1[5]
L4_1 = L7_1.utf8p1
L5_1 = L1_1.ppid
L7_1 = {}
L8_1 = "/curl"
L9_1 = "/wget"
L7_1[1] = L8_1
L7_1[2] = L9_1
L8_1 = ipairs
L9_1 = L7_1
L8_1, L9_1, L10_1 = L8_1(L9_1)
for L11_1, L12_1 in L8_1, L9_1, L10_1 do
  L14_1 = L0_1
  L13_1 = L0_1.sub
  L15_1 = #L12_1
  L15_1 = -L15_1
  L13_1 = L13_1(L14_1, L15_1)
  if L13_1 == L12_1 then
    L13_1 = mp
    L13_1 = L13_1.CLEAN
    return L13_1
  end
end
L8_1 = "user-agent"
L9_1 = pcall
L10_1 = MpCommon
L10_1 = L10_1.RollingQueueQueryKey
L11_1 = L8_1
L12_1 = L5_1
L9_1, L10_1 = L9_1(L10_1, L11_1, L12_1)
if L9_1 then
  L11_1 = next
  L12_1 = L10_1
  L11_1 = L11_1(L12_1)
  if L11_1 then
    L6_1 = L10_1.value
  end
end
if L6_1 ~= nil then
  L11_1 = string
  L11_1 = L11_1.find
  L12_1 = L2_1
  L13_1 = L6_1
  L14_1 = 1
  L15_1 = true
  L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
  if L11_1 then
    L11_1 = taint
    L12_1 = L4_1
    L13_1 = "remote_file_created_taint"
    L14_1 = 3600
    L11_1(L12_1, L13_1, L14_1)
    L11_1 = AppendToRollingQueue
    L12_1 = "queue_pid_taintfactory_a"
    L13_1 = L5_1
    L14_1 = 1
    L15_1 = 600
    L11_1(L12_1, L13_1, L14_1, L15_1)
    L11_1 = bm
    L11_1 = L11_1.get_process_relationships
    L11_1, L12_1 = L11_1()
    _ = L12_1
    L3_1 = L11_1
    L11_1 = ipairs
    L12_1 = L3_1
    L11_1, L12_1, L13_1 = L11_1(L12_1)
    for L14_1, L15_1 in L11_1, L12_1, L13_1 do
      L16_1 = mp
      L16_1 = L16_1.bitand
      L17_1 = L15_1.reason_ex
      L18_1 = 1
      L16_1 = L16_1(L17_1, L18_1)
      if L16_1 == 1 then
        L16_1 = bm
        L16_1 = L16_1.add_related_file
        L17_1 = L15_1.image_path
        L16_1(L17_1)
        L16_1 = bm
        L16_1 = L16_1.add_related_process
        L17_1 = L15_1.ppid
        L16_1(L17_1)
        L16_1 = TrackPidAndTechniqueBM
        L17_1 = L15_1.ppid
        L18_1 = "T1036.003"
        L19_1 = "DefenseEvasion"
        L16_1(L17_1, L18_1, L19_1)
        L16_1 = mp
        L16_1 = L16_1.INFECTED
        return L16_1
      end
    end
  end
end
L11_1 = mp
L11_1 = L11_1.CLEAN
return L11_1
