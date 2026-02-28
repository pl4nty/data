local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.IsHipsRuleEnabled
L1_1 = "d4f940ab-401b-4efc-aadc-ad5f3c50688a"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONOPEN
  if L0_1 ~= L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FNAME
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L2_1(L3_1, L4_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
if L1_1 == nil or L1_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.len
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 < 20 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.sub
L3_1 = L1_1
L4_1 = -14
L2_1 = L2_1(L3_1, L4_1)
if L2_1 ~= "vbaproject.bin" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.getfilename
L3_1 = mp
L3_1 = L3_1.bitor
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_CNAME
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_LOWERCASE
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L3_1(L4_1, L5_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
if L2_1 == nil or L2_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.get_mpattribute
L4_1 = "MHSTR:CreateScheduledTaskFromMacro"
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = MpCommon
  L3_1 = L3_1.QueryPersistContext
  L4_1 = L2_1
  L5_1 = "enghipscpy:MHSTRCreateScheduledTaskFromMacro"
  L3_1 = L3_1(L4_1, L5_1)
  if not L3_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
end
L3_1 = GetCtxOfficeProc
L3_1 = L3_1()
if L3_1 ~= "productivity" and L3_1 ~= "productivity2" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = false
L5_1 = string
L5_1 = L5_1.lower
L6_1 = MpCommon
L6_1 = L6_1.PathToWin32Path
L7_1 = L2_1
L6_1, L7_1, L8_1, L9_1 = L6_1(L7_1)
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
L2_1 = L5_1
if L2_1 == nil or L2_1 == "" then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = sysio
L5_1 = L5_1.IsFileExists
L6_1 = L2_1
L5_1 = L5_1(L6_1)
if L5_1 then
  L4_1 = true
end
if L4_1 then
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L2_1
  L7_1 = "\\program files\\microsoft office\\"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L2_1
  L7_1 = "\\program files (x86)\\microsoft office\\"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L2_1
  L7_1 = "\\program files\\windowsapps\\microsoft.office.desktop.excel"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L2_1
  L7_1 = "\\program files (x86)\\windowsapps\\microsoft.office.desktop.excel"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = mp
  L5_1 = L5_1.IsPathExcludedForHipsRule
  L6_1 = L2_1
  L7_1 = "d4f940ab-401b-4efc-aadc-ad5f3c50688a"
  L5_1 = L5_1(L6_1, L7_1)
  if L5_1 then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
end
L5_1 = nil
L6_1 = GetInvolvedFileInCmdLnIfExistOnMachine
L6_1 = L6_1()
L5_1 = L6_1
if L5_1 ~= nil then
  L6_1 = mp
  L6_1 = L6_1.IsPathExcludedForHipsRule
  L7_1 = L5_1
  L8_1 = "d4f940ab-401b-4efc-aadc-ad5f3c50688a"
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
end
L6_1 = mp
L6_1 = L6_1.set_mpattribute
L7_1 = "MpDisableCaching"
L6_1(L7_1)
L6_1 = mp
L6_1 = L6_1.INFECTED
return L6_1
