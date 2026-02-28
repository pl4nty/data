local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1

function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = mp
  L3_2 = L3_2.GetParentProcInfo
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 == nil then
    return
  end
  A0_2 = L3_2.ppid
  if A0_2 == nil then
    return
  end
  L4_2 = TrackPidAndTechniqueBM
  L5_2 = A0_2
  L6_2 = A1_2
  L7_2 = A2_2
  L4_2(L5_2, L6_2, L7_2)
  return
end

propagateTTParent = L0_1
L0_1 = nil
L1_1 = nil
L2_1 = nil
L3_1 = nil
L4_1 = bm
L4_1 = L4_1.get_current_process_startup_info
L4_1 = L4_1()
L5_1 = L4_1.command_line
L6_1 = bm
L6_1 = L6_1.get_imagepath
L6_1 = L6_1()
L7_1 = this_sigattrlog
L7_1 = L7_1[1]
L7_1 = L7_1.matched
if L7_1 then
  L7_1 = this_sigattrlog
  L7_1 = L7_1[1]
  L0_1 = L7_1.utf8p1
  L7_1 = this_sigattrlog
  L7_1 = L7_1[1]
  L1_1 = L7_1.utf8p2
  L7_1 = this_sigattrlog
  L7_1 = L7_1[1]
  L2_1 = L7_1.ppid
  L7_1 = this_sigattrlog
  L7_1 = L7_1[1]
  L3_1 = L7_1.image_path
end
if not (L0_1 and L1_1 and L2_1 and L3_1) or not L5_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = IsExcludedByCmdlineMacOS
L8_1 = L5_1
L7_1 = L7_1(L8_1)
if not L7_1 then
  L7_1 = IsExcludedByImagePathMacOS
  L8_1 = L6_1
  L7_1 = L7_1(L8_1)
  if not L7_1 then
    goto lbl_54
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
do return L7_1 end
::lbl_54::
L7_1 = string
L7_1 = L7_1.match
L8_1 = L0_1
L9_1 = "T%d%d%d%d"
L7_1 = L7_1(L8_1, L9_1)
if not L7_1 or L1_1 == "INFECTED" then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = GetTechniquesCountForPid
L8_1 = L2_1
L7_1 = L7_1(L8_1)
if L7_1 ~= nil and 1 < L7_1 then
  L8_1 = bm
  L8_1 = L8_1.trigger_sig
  L9_1 = "SuspiciousMacTTPRel"
  L10_1 = "Detected"
  L8_1(L9_1, L10_1)
end
L8_1 = propagateTTParent
L9_1 = L2_1
L10_1 = L0_1
L11_1 = L1_1
L8_1(L9_1, L10_1, L11_1)
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
