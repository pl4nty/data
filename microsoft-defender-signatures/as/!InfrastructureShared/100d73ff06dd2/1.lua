local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = L0_1.image_path
  L1_1 = L1_1(L2_1)
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L1_1
  L4_1 = "\\programdata\\microsoft\\azurewatson\\0\\awdumpifeo.exe"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if not L2_1 then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L1_1
    L4_1 = "\\windows\\system32\\werfault.exe"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if not L2_1 then
      L2_1 = string
      L2_1 = L2_1.find
      L3_1 = L1_1
      L4_1 = "\\windows\\syswow64\\werfault.exe"
      L5_1 = 1
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if not L2_1 then
        goto lbl_40
      end
    end
  end
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
::lbl_40::
L1_1 = mp
L1_1 = L1_1.GetScannedPPID
L1_1 = L1_1()
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.GetProcessCommandLine
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 then
  L3_1 = #L2_1
  if not (L3_1 <= 18) then
    goto lbl_60
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_60::
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L2_1 = L3_1
L3_1 = string
L3_1 = L3_1.match
L4_1 = L2_1
L5_1 = "[%-/]m[acdkmp] \"?([%d]+)\"?"
L3_1 = L3_1(L4_1, L5_1)
if not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = tonumber
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L3_1 = L4_1
L4_1 = mp
L4_1 = L4_1.GetPPidFromPid
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L5_1 = MpCommon
L5_1 = L5_1.GetImagePathFromPid
L6_1 = L4_1
L5_1 = L5_1(L6_1)
if not L5_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = string
L6_1 = L6_1.find
L8_1 = L5_1
L7_1 = L5_1.lower
L7_1 = L7_1(L8_1)
L8_1 = "\\windows\\system32\\lsass.exe"
L9_1 = 1
L10_1 = true
L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
if L6_1 then
  L6_1 = TrackPidAndTechnique
  L7_1 = "CMDHSTR"
  L8_1 = "T1003.001"
  L9_1 = "credentialdumping_concrete"
  L10_1 = 86400
  L6_1(L7_1, L8_1, L9_1, L10_1)
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
