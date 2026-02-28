local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.ppid
  if L1_1 ~= nil then
    goto lbl_12
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_12::
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1 = L1_1()
L2_1 = bm
L2_1 = L2_1.get_current_process_startup_info
L2_1 = L2_1()
L3_1 = L2_1.command_line
L4_1 = IsExcludedByCmdlineMacOS
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if not L4_1 then
  L4_1 = IsExcludedByImagePathMacOS
  L5_1 = L1_1
  L4_1 = L4_1(L5_1)
  if not L4_1 then
    goto lbl_32
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_32::
L4_1 = nil
L5_1 = 0
L6_1 = this_sigattrlog
L6_1 = L6_1[8]
L6_1 = L6_1.matched
if L6_1 then
  L6_1 = this_sigattrlog
  L6_1 = L6_1[8]
  L6_1 = L6_1.utf8p1
  if L6_1 ~= nil then
    L6_1 = this_sigattrlog
    L6_1 = L6_1[8]
    L6_1 = L6_1.np2
    if L6_1 ~= nil then
      L6_1 = this_sigattrlog
      L6_1 = L6_1[8]
      L4_1 = L6_1.utf8p1
      L6_1 = this_sigattrlog
      L6_1 = L6_1[8]
      L5_1 = L6_1.np2
    end
  end
end
if L4_1 == nil or L5_1 == nil then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end

function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = SuspMacPathsToMonitor
  L2_2 = A0_2
  L3_2 = true
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 then
    L1_2 = true
    return L1_2
  end
  L2_2 = A0_2
  L1_2 = A0_2.find
  L3_2 = "^/Users/[^/]+/Desktop/"
  L4_2 = 1
  L5_2 = false
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
  if not L1_2 then
    L2_2 = A0_2
    L1_2 = A0_2.find
    L3_2 = "^/Users/[^/]+/Documents/"
    L4_2 = 1
    L5_2 = false
    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
    if not L1_2 then
      L2_2 = A0_2
      L1_2 = A0_2.find
      L3_2 = "^/Users/[^/]+/Downloads/"
      L4_2 = 1
      L5_2 = false
      L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
      if not L1_2 then
        L2_2 = A0_2
        L1_2 = A0_2.find
        L3_2 = "^/Users/[^/]+/Library/[^/]+$"
        L4_2 = 1
        L5_2 = false
        L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
        if not L1_2 then
          L2_2 = A0_2
          L1_2 = A0_2.find
          L3_2 = "^/Users/[^/]+/Library/[^/]+/[^/]+$"
          L4_2 = 1
          L5_2 = false
          L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
          if not L1_2 then
            L2_2 = A0_2
            L1_2 = A0_2.find
            L3_2 = "^/Library/[^/]+$"
            L4_2 = 1
            L5_2 = false
            L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
            if not L1_2 then
              L2_2 = A0_2
              L1_2 = A0_2.find
              L3_2 = "^/Library/[^/]+/[^/]+$"
              L4_2 = 1
              L5_2 = false
              L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
              if not L1_2 then
                goto lbl_60
              end
            end
          end
        end
      end
    end
  end
  L1_2 = true
  do return L1_2 end
  ::lbl_60::
  L1_2 = false
  return L1_2
end

ExtendedSuspMacPathsToMonitor = L6_1
L6_1 = ExtendedSuspMacPathsToMonitor
L7_1 = L4_1
L6_1 = L6_1(L7_1)
if not L6_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = IsChmodMacOSExcluded
L7_1 = L4_1
L6_1 = L6_1(L7_1)
if L6_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = tonumber
L7_1 = tostring
L8_1 = L5_1
L7_1 = L7_1(L8_1)
L8_1 = 8
L6_1 = L6_1(L7_1, L8_1)
L7_1 = mp
L7_1 = L7_1.bsplit
L8_1 = L6_1
L9_1 = 3
L7_1, L8_1, L9_1, L10_1 = L7_1(L8_1, L9_1)
if L7_1 == 0 and L8_1 == 0 and L9_1 == 0 and L10_1 == 0 then
  L11_1 = mp
  L11_1 = L11_1.CLEAN
  return L11_1
end
L11_1 = bm
L11_1 = L11_1.get_imagepath
L11_1 = L11_1()
if L11_1 == nil then
  L12_1 = mp
  L12_1 = L12_1.CLEAN
  return L12_1
end
L12_1 = "BM"
L13_1 = string
L13_1 = L13_1.find
L14_1 = L11_1
L15_1 = "/chmod"
L16_1 = -6
L17_1 = true
L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
if L13_1 then
  L12_1 = L0_1.ppid
end
L13_1 = false
L14_1 = mp
L14_1 = L14_1.bitand
L15_1 = L7_1
L16_1 = 1
L14_1 = L14_1(L15_1, L16_1)
if L14_1 ~= 1 then
  L14_1 = mp
  L14_1 = L14_1.bitand
  L15_1 = L8_1
  L16_1 = 1
  L14_1 = L14_1(L15_1, L16_1)
  if L14_1 ~= 1 then
    L14_1 = mp
    L14_1 = L14_1.bitand
    L15_1 = L9_1
    L16_1 = 1
    L14_1 = L14_1(L15_1, L16_1)
    if L14_1 ~= 1 then
      goto lbl_163
    end
  end
end
if L12_1 == "BM" then
  L14_1 = bm
  L14_1 = L14_1.trigger_sig
  L15_1 = "MacChmodToExec"
  L16_1 = L4_1
  L14_1(L15_1, L16_1)
else
  L14_1 = bm
  L14_1 = L14_1.trigger_sig
  L15_1 = "MacChmodToExec"
  L16_1 = L4_1
  L17_1 = L12_1
  L14_1(L15_1, L16_1, L17_1)
end
L14_1 = TrackPidAndTechniqueBM
L15_1 = L12_1
L16_1 = "T1222.002"
L17_1 = "DefenseEvasion_PermissionModification_MacChmodToExec"
L14_1(L15_1, L16_1, L17_1)
L13_1 = true
::lbl_163::
L14_1 = mp
L14_1 = L14_1.bitand
L15_1 = L10_1
L16_1 = 2
L14_1 = L14_1(L15_1, L16_1)
if L14_1 ~= 2 then
  L14_1 = mp
  L14_1 = L14_1.bitand
  L15_1 = L10_1
  L16_1 = 4
  L14_1 = L14_1(L15_1, L16_1)
  if L14_1 ~= 4 then
    goto lbl_197
  end
end
if L12_1 == "BM" then
  L14_1 = bm
  L14_1 = L14_1.trigger_sig
  L15_1 = "UidGidChange"
  L16_1 = L4_1
  L14_1(L15_1, L16_1)
else
  L14_1 = bm
  L14_1 = L14_1.trigger_sig
  L15_1 = "UidGidChange"
  L16_1 = L4_1
  L17_1 = L12_1
  L14_1(L15_1, L16_1, L17_1)
end
L14_1 = TrackPidAndTechniqueBM
L15_1 = L12_1
L16_1 = "T1548.001"
L17_1 = "PrivilegeEscalation_AbuseElevationControlMechanism_MacSetuidSetgid"
L14_1(L15_1, L16_1, L17_1)
L13_1 = true
::lbl_197::
if L13_1 == false then
  L14_1 = mp
  L14_1 = L14_1.CLEAN
  return L14_1
end
L14_1 = bm
L14_1 = L14_1.add_related_file
L15_1 = L4_1
L14_1(L15_1)
L14_1 = addRelatedProcess
L14_1()
L14_1 = mp
L14_1 = L14_1.INFECTED
return L14_1
