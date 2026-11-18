-- Threat: !InfrastructureShared
-- Name: !#Lua:Context/DllDroppedByScript
-- Type: 13
-- MpAttributes: MpNewlyCreatedHint & BM_MZ_DLL & MpOnOpenOrCloseRtpScan & RPF:TopLevelFile

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_1, l_0_2 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_FNAME), mp.FILEPATH_QUERY_LOWERCASE))
local l_0_3 = ""
if l_0_0 == "wscript.exe" then
  if (l_0_2 == "remoteconnection.ocx" or l_0_2 == "scheduleservices.ocx") and string.find(l_0_1, "\\windows\\downloaded program files\\", 1, true) then
    return mp.CLEAN
  end
  l_0_3 = "DllDroppedByWscript"
elseif l_0_0 == "cscript.exe" then
  if (l_0_2 == "clrtablist.dll" or l_0_2 == "clrmachineInfo.dll" or l_0_2 == "certadm.dll" or l_0_2 == "riainrsimport.dll") and string.find(l_0_1, "\\windows\\syswow64\\", 1, true) then
    return mp.CLEAN
  end
  l_0_3 = "DllDroppedByCscript"
else
  return mp.CLEAN
end
local l_0_4 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
local l_0_5 = MpCommon.QueryPersistContext(l_0_4, l_0_3)
if not l_0_5 then
  MpCommon.AppendPersistContext(l_0_4, l_0_3, 100)
end
mp.set_mpattribute("MpDisableCaching")
return mp.INFECTED
