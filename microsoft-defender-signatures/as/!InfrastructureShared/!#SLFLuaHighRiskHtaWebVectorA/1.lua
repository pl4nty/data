local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = {}
L1_1["outlook.exe"] = ""
L1_1["iexplore.exe"] = ""
L1_1["browser_broker.exe"] = ""
L1_1["firefox.exe"] = ""
L1_1["chrome.exe"] = ""
L1_1["winword.exe"] = ""
L1_1["powerpnt.exe"] = ""
L1_1["excel.exe"] = ""
L1_1["acrord32.exe"] = ""
L1_1["slack.exe"] = ""
L2_1 = false
L3_1 = string
L3_1 = L3_1.lower
L4_1 = mp
L4_1 = L4_1.get_contextdata
L5_1 = mp
L5_1 = L5_1.CONTEXT_DATA_PROCESSNAME
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L4_1(L5_1)
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
L4_1 = L1_1[L3_1]
if not L4_1 then
  L4_1 = isOutlookProcess
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  if not L4_1 then
    goto lbl_40
  end
end
L4_1 = mp
L4_1 = L4_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 == L4_1 then
  L2_1 = true
else
  ::lbl_40::
  L4_1 = mp
  L4_1 = L4_1.get_contextdata
  L5_1 = mp
  L5_1 = L5_1.CONTEXT_DATA_HAS_MOTW_ADS
  L4_1 = L4_1(L5_1)
  if L4_1 == true then
    L4_1 = mp
    L4_1 = L4_1.SCANREASON_ONOPEN
    if L0_1 == L4_1 then
      L4_1 = mp
      L4_1 = L4_1.GetMOTWZone
      L4_1 = L4_1()
      if L4_1 == 3 or L4_1 == 4 then
        L2_1 = true
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.getfilename
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_FULL
L4_1 = L4_1(L5_1)
L5_1 = string
L5_1 = L5_1.lower
L6_1 = L4_1
L5_1 = L5_1(L6_1)
L6_1 = #L5_1
if 17 <= L6_1 then
  L7_1 = L5_1
  L6_1 = L5_1.sub
  L8_1 = 2
  L9_1 = 17
  L6_1 = L6_1(L7_1, L8_1, L9_1)
  if L6_1 == ":\\program files\\" then
    goto lbl_95
  end
end
L6_1 = #L5_1
if 23 <= L6_1 then
  L7_1 = L5_1
  L6_1 = L5_1.sub
  L8_1 = 2
  L9_1 = 23
  L6_1 = L6_1(L7_1, L8_1, L9_1)
  if L6_1 == ":\\program files (x86)\\" then
    goto lbl_95
  end
end
L6_1 = #L5_1
if 11 <= L6_1 then
  L7_1 = L5_1
  L6_1 = L5_1.sub
  L8_1 = 2
  L9_1 = 11
  L6_1 = L6_1(L7_1, L8_1, L9_1)
  ::lbl_95::
  if L6_1 == ":\\windows\\" then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
end
if L2_1 then
  L6_1 = mp
  L6_1 = L6_1.set_mpattribute
  L7_1 = "MpDisableCaching"
  L6_1(L7_1)
  L6_1 = MpCommon
  L6_1 = L6_1.AppendPersistContext
  L7_1 = L4_1
  L8_1 = "Lua:HighRiskHtaWebVector"
  L9_1 = 0
  L6_1(L7_1, L8_1, L9_1)
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
