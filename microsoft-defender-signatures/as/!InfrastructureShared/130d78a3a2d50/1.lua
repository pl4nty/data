local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = false
L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L1_1 = L1_1()
if L1_1 then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L1_1.image_path
  L2_1 = L2_1(L3_1)
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L2_1
  L5_1 = "\\programdata\\microsoft\\azurewatson\\0\\awdumpifeo.exe"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if not L3_1 then
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = L2_1
    L5_1 = "\\windows\\system32\\werfault.exe"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if not L3_1 then
      L3_1 = string
      L3_1 = L3_1.find
      L4_1 = L2_1
      L5_1 = "\\windows\\syswow64\\werfault.exe"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if not L3_1 then
        goto lbl_41
      end
    end
  end
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
::lbl_41::
L2_1 = hstrlog
L2_1 = L2_1[4]
L2_1 = L2_1.matched
if not L2_1 then
  L2_1 = hstrlog
  L2_1 = L2_1[5]
  L2_1 = L2_1.matched
  if not L2_1 then
    goto lbl_52
  end
end
L0_1 = true
::lbl_52::
if not L0_1 then
  L2_1 = hstrlog
  L2_1 = L2_1[6]
  L2_1 = L2_1.matched
  if not L2_1 then
    L2_1 = hstrlog
    L2_1 = L2_1[7]
    L2_1 = L2_1.matched
    if not L2_1 then
      goto lbl_127
    end
  end
  L2_1 = mp
  L2_1 = L2_1.GetScannedPPID
  L2_1 = L2_1()
  if not L2_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = mp
  L3_1 = L3_1.GetProcessCommandLine
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L4_1 = #L3_1
    if not (L4_1 <= 18) then
      goto lbl_84
    end
  end
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  do return L4_1 end
  ::lbl_84::
  L4_1 = string
  L4_1 = L4_1.lower
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  L3_1 = L4_1
  L4_1 = string
  L4_1 = L4_1.match
  L5_1 = L3_1
  L6_1 = "[%-/]m[acdkmp] \"?([%d]+)\"?"
  L4_1 = L4_1(L5_1, L6_1)
  if not L4_1 then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = tonumber
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  L4_1 = L5_1
  L5_1 = mp
  L5_1 = L5_1.GetPPidFromPid
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  L6_1 = MpCommon
  L6_1 = L6_1.GetImagePathFromPid
  L7_1 = L5_1
  L6_1 = L6_1(L7_1)
  if not L6_1 then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
  L7_1 = string
  L7_1 = L7_1.find
  L9_1 = L6_1
  L8_1 = L6_1.lower
  L8_1 = L8_1(L9_1)
  L9_1 = "\\local\\microsoft\\onedrive\\onedrive.exe"
  L10_1 = 1
  L11_1 = true
  L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
  if L7_1 then
    L0_1 = true
  end
end
::lbl_127::
if L0_1 then
  L2_1 = TrackPidAndTechnique
  L3_1 = "CMDHSTR"
  L4_1 = "T1003.001"
  L5_1 = "credentialdumping"
  L6_1 = 86400
  L2_1(L3_1, L4_1, L5_1, L6_1)
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
