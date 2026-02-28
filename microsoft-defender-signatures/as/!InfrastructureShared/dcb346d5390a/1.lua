local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = "PrintProcessor"
L1_1 = string
L1_1 = L1_1.match
L2_1 = this_sigattrlog
L2_1 = L2_1[3]
L2_1 = L2_1.utf8p1
if not L2_1 then
  L2_1 = ""
end
L3_1 = "%\\([^%\\]+)%\\%\\"
L1_1 = L1_1(L2_1, L3_1)
L2_1 = this_sigattrlog
L2_1 = L2_1[3]
L2_1 = L2_1.utf8p2
L3_1 = isnull
L4_1 = L1_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = isnull
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    goto lbl_28
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_28::
L3_1 = string
L3_1 = L3_1.find
L4_1 = L2_1
L5_1 = "\\"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
L3_1 = L2_1 or L3_1
if not L3_1 or not L2_1 then
  L3_1 = string
  L3_1 = L3_1.format
  L4_1 = "C:\\Windows\\System32\\spool\\prtprocs\\x64\\%s"
  L5_1 = L2_1
  L3_1 = L3_1(L4_1, L5_1)
end
L4_1 = GetRollingQueueKeyValue
L5_1 = "SuspiciousDLL.PrtProc.Exports"
L6_1 = string
L6_1 = L6_1.lower
L7_1 = L3_1
L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1 = L6_1(L7_1)
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1)
L5_1 = isnull
L6_1 = L4_1
L5_1 = L5_1(L6_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.match
L6_1 = L4_1 or L6_1
if not L4_1 then
  L6_1 = ""
end
L7_1 = "Count=(%d+)_List=(.+)_MissingReq=(%d+)"
L5_1, L6_1, L7_1 = L5_1(L6_1, L7_1)
if L5_1 and L6_1 and L7_1 then
  L8_1 = tonumber
  L9_1 = L5_1
  L8_1 = L8_1(L9_1)
  if L8_1 ~= 0 then
    goto lbl_80
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
do return L8_1 end
::lbl_80::
L8_1 = bm
L8_1 = L8_1.add_threat_file
L9_1 = L3_1
L8_1(L9_1)
L8_1 = bm
L8_1 = L8_1.add_related_string
L9_1 = L0_1
L10_1 = safeJsonSerialize
L11_1 = {}
L11_1.DriverName = L1_1
L11_1.DriverFile = L2_1
L11_1.DriverPath = L3_1
L12_1 = L5_1 or L12_1
if not L5_1 then
  L12_1 = -1
end
L11_1.ExpCount = L12_1
L12_1 = L6_1 or L12_1
if not L6_1 then
  L12_1 = "?"
end
L11_1.ExpList = L12_1
L12_1 = L7_1 or L12_1
if not L7_1 then
  L12_1 = -1
end
L11_1.ExpMissing = L12_1
L10_1 = L10_1(L11_1)
L11_1 = bm
L11_1 = L11_1.RelatedStringBMReport
L8_1(L9_1, L10_1, L11_1)
L8_1 = bm
L8_1 = L8_1.get_current_process_startup_info
L8_1 = L8_1()
if L8_1 then
  L9_1 = L8_1.ppid
  if L9_1 then
    L9_1 = TrackPidAndTechniqueBM
    L10_1 = L8_1.ppid
    L11_1 = "T1547.012"
    L12_1 = "persist_printprocessor_driver"
    L9_1(L10_1, L11_1, L12_1)
  end
end
L9_1 = mp
L9_1 = L9_1.INFECTED
return L9_1
