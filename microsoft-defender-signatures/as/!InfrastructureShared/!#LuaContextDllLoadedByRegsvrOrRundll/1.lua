-- Threat: !InfrastructureShared
-- Name: !#Lua:Context/DllLoadedByRegsvrOrRundll
-- Type: 13
-- MpAttributes: BM_MZ_DLL & MpOnOpenOrCloseRtpScan & RPF:TopLevelFile & !MpNewlyCreatedHint

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if l_0_0 ~= "regsvr32.exe" and l_0_0 ~= "rundll32.exe" then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if MpCommon.QueryPersistContext(l_0_1, "DllLoadedViaLnk") then
  if l_0_0 == "regsvr32.exe" then
    mp.set_mpattribute("Lua:Context/DllViaLnkRegsvrLoad")
  elseif l_0_0 == "rundll32.exe" then
    mp.set_mpattribute("Lua:Context/DllviaLnkRundllLoad")
  end
end
return mp.CLEAN
