local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "MpOnOpenOrCloseRtpScan"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattributesubstring
  L1_1 = "BM_SCHEDULEDTASK_JOBFILE"
  L0_1 = L0_1(L1_1)
  if L0_1 then
    L0_1 = mp
    L0_1 = L0_1.get_mpattributesubstring
    L1_1 = "SCPT:SchTaskHighPriv"
    L0_1 = L0_1(L1_1)
    if L0_1 then
      goto lbl_22
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_22::
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "TEL:Script/SchTaskSysHighPriv.A"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FULL
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "\\system32\\tasks\\.+\\."
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetBruteMatchData
L1_1 = L1_1()
L2_1 = ""
L3_1 = L1_1.is_header
if L3_1 then
  L3_1 = tostring
  L4_1 = headerpage
  L3_1 = L3_1(L4_1)
  L2_1 = L3_1
else
  L3_1 = tostring
  L4_1 = footerpage
  L3_1 = L3_1(L4_1)
  L2_1 = L3_1
end
L3_1 = string
L3_1 = L3_1.match
L4_1 = string
L4_1 = L4_1.lower
L5_1 = L2_1
L4_1 = L4_1(L5_1)
L5_1 = "<command>(.+)</command>"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L4_1 = set_research_data
  L5_1 = "command"
  L6_1 = L3_1
  L7_1 = false
  L4_1(L5_1, L6_1, L7_1)
end
L4_1 = string
L4_1 = L4_1.match
L5_1 = string
L5_1 = L5_1.lower
L6_1 = L2_1
L5_1 = L5_1(L6_1)
L6_1 = "<arguments>(.+)</arguments>"
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L5_1 = set_research_data
  L6_1 = "arguments"
  L7_1 = L4_1
  L8_1 = false
  L5_1(L6_1, L7_1, L8_1)
end
L5_1 = MpCommon
L5_1 = L5_1.GetPersistContextCountNoPath
L6_1 = "TaskSchedMiscTrigger"
L5_1 = L5_1(L6_1)
if 0 < L5_1 and (L3_1 or L4_1) then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
