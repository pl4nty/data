local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = L0_1.command_line
if L1_1 then
  L2_1 = string
  L2_1 = L2_1.match
  L3_1 = L1_1
  L4_1 = "((%d+)%.(%d+)%.(%d+)%.(%d+))"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 then
    L3_1 = "queue_remotedir_mount"
    L4_1 = "dir_name"
    L5_1 = StringSplit
    L6_1 = L1_1
    L7_1 = " "
    L5_1 = L5_1(L6_1, L7_1)
    if L5_1 ~= nil then
      L6_1 = #L5_1
      if not (L6_1 < 4) then
        goto lbl_33
      end
    end
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    do return L6_1 end
    ::lbl_33::
    L6_1 = ipairs
    L7_1 = L5_1
    L6_1, L7_1, L8_1 = L6_1(L7_1)
    for L9_1, L10_1 in L6_1, L7_1, L8_1 do
      if 1 < L9_1 and L10_1 ~= nil then
        L11_1 = sysio
        L11_1 = L11_1.IsFolderExists
        L12_1 = L10_1
        L11_1 = L11_1(L12_1)
        if L11_1 then
          L11_1 = IsKeyValuePairInRollingQueue
          L12_1 = L3_1
          L13_1 = L4_1
          L14_1 = L10_1
          L11_1 = L11_1(L12_1, L13_1, L14_1)
          if not L11_1 then
            L11_1 = AppendToRollingQueue
            L12_1 = L3_1
            L13_1 = L4_1
            L14_1 = L10_1
            L15_1 = 3600
            L11_1(L12_1, L13_1, L14_1, L15_1)
          end
          L11_1 = addRelatedProcess
          L11_1()
          L11_1 = reportRelatedBmHits
          L11_1()
          L11_1 = TrackPidAndTechniqueBM
          L12_1 = "BM"
          L13_1 = "T1080"
          L14_1 = "LateralMovement_TaintSharedContent_SuspiciousMount"
          L11_1(L12_1, L13_1, L14_1)
          L11_1 = mp
          L11_1 = L11_1.INFECTED
          return L11_1
        end
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
