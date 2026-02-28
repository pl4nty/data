local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 then
  L1_1 = L0_1.image_path
  if L1_1 then
    goto lbl_12
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_12::
L1_1 = {}
L2_1 = "werfault.exe"
L3_1 = "svchost.exe"
L4_1 = "WerFaultSecure.exe"
L5_1 = "wermgr.exe"
L6_1 = "NisSrv.exe"
L7_1 = "mighost.exe"
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L1_1[4] = L5_1
L1_1[5] = L6_1
L1_1[6] = L7_1
if L0_1 then
  L2_1 = L0_1.image_path
  if L2_1 then
    L2_1 = Contains_any_caseinsenstive
    L3_1 = L0_1.image_path
    L4_1 = L1_1
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
  end
end
L2_1 = mp
L2_1 = L2_1.GetScannedPPID
L2_1 = L2_1()
if L2_1 == "" or L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.GetProcessCommandLine
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.lower
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L3_1 = L4_1
L4_1 = string
L4_1 = L4_1.match
L5_1 = L3_1
L6_1 = "/pid%s+(%d+)"
L4_1 = L4_1(L5_1, L6_1)
L5_1 = string
L5_1 = L5_1.match
L6_1 = L0_1.ppid
L7_1 = "/pid%s+(%d+)"
L5_1 = L5_1(L6_1, L7_1)
if not L4_1 or L5_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
if L5_1 == L4_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = MpCommon
L6_1 = L6_1.BmTriggerSig
L7_1 = L0_1.ppid
L8_1 = "SuspWerFaultSec_CMD_2"
L9_1 = L3_1
L6_1(L7_1, L8_1, L9_1)
L6_1 = mp
L6_1 = L6_1.INFECTED
return L6_1
