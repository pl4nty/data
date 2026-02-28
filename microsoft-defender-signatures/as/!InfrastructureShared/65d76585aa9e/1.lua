local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.ppid
  if L1_1 ~= nil then
    L1_1 = L0_1.image_path
    if L1_1 ~= nil then
      goto lbl_15
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_15::
L1_1 = mp
L1_1 = L1_1.GetScannedPPID
L1_1 = L1_1()
if L1_1 == "" or L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.GetProcessCommandLine
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 == "" or L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = ""
L4_1 = string
L4_1 = L4_1.lower
L5_1 = L2_1
L4_1 = L4_1(L5_1)
L2_1 = L4_1
L4_1 = string
L4_1 = L4_1.gsub
L5_1 = L2_1
L6_1 = "'"
L7_1 = "\""
L4_1 = L4_1(L5_1, L6_1, L7_1)
L2_1 = L4_1
L4_1 = string
L4_1 = L4_1.gsub
L5_1 = L2_1
L6_1 = "\"\""
L7_1 = "\""
L4_1 = L4_1(L5_1, L6_1, L7_1)
L2_1 = L4_1
L4_1 = string
L4_1 = L4_1.match
L5_1 = L2_1
L6_1 = "stop[%s]*\""
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L4_1 = string
  L4_1 = L4_1.match
  L5_1 = L2_1
  L6_1 = "stop[%s]*\"([^\"]+)\"[%s]*"
  L4_1 = L4_1(L5_1, L6_1)
  L3_1 = L4_1
else
  L4_1 = string
  L4_1 = L4_1.match
  L5_1 = L2_1
  L6_1 = "stop[%s]*(%S+)[%s]*"
  L4_1 = L4_1(L5_1, L6_1)
  L3_1 = L4_1
end
if L3_1 == "" or L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = {}
L4_1.hpaudioanalytics = true
L4_1.dellclientmanagementservice = true
L5_1 = L4_1[L3_1]
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = TrackPidAndTechnique
L6_1 = L0_1.ppid
L7_1 = "T1489"
L8_1 = "svc_stop_"
L9_1 = L3_1
L8_1 = L8_1 .. L9_1
L5_1(L6_1, L7_1, L8_1)
L5_1 = TT_IsProdCriticalService
L6_1 = L3_1
L5_1 = L5_1(L6_1)
if not L5_1 then
  L5_1 = IsDetectionThresholdMet
  L6_1 = L0_1.ppid
  L5_1 = L5_1(L6_1)
  if not L5_1 then
    goto lbl_118
  end
end
L5_1 = AppendToRollingQueue
L6_1 = "TT_ModifiedCriticalServices"
L7_1 = L3_1
L8_1 = "disabled"
L9_1 = 3600
L5_1(L6_1, L7_1, L8_1, L9_1)
L5_1 = mp
L5_1 = L5_1.INFECTED
do return L5_1 end
::lbl_118::
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
