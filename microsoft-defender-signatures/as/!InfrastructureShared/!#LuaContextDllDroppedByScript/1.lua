local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_PROCESSNAME
L0_1 = L0_1(L1_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.bitor
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_PATH
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_FNAME
L3_1 = L3_1(L4_1, L5_1)
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L2_1(L3_1, L4_1)
L1_1, L2_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
L3_1 = ""
if L0_1 == "wscript.exe" then
  if L2_1 == "remoteconnection.ocx" or L2_1 == "scheduleservices.ocx" then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L1_1
    L6_1 = "\\windows\\downloaded program files\\"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if L4_1 then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
  end
  L3_1 = "DllDroppedByWscript"
elseif L0_1 == "cscript.exe" then
  if L2_1 == "clrtablist.dll" or L2_1 == "clrmachineInfo.dll" or L2_1 == "certadm.dll" or L2_1 == "riainrsimport.dll" then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L1_1
    L6_1 = "\\windows\\syswow64\\"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if L4_1 then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
  end
  L3_1 = "DllDroppedByCscript"
else
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.getfilename
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_LOWERCASE
L4_1 = L4_1(L5_1)
L5_1 = MpCommon
L5_1 = L5_1.QueryPersistContext
L6_1 = L4_1
L7_1 = L3_1
L5_1 = L5_1(L6_1, L7_1)
if not L5_1 then
  L6_1 = MpCommon
  L6_1 = L6_1.AppendPersistContext
  L7_1 = L4_1
  L8_1 = L3_1
  L9_1 = 100
  L6_1(L7_1, L8_1, L9_1)
end
L6_1 = mp
L6_1 = L6_1.set_mpattribute
L7_1 = "MpDisableCaching"
L6_1(L7_1)
L6_1 = mp
L6_1 = L6_1.INFECTED
return L6_1
