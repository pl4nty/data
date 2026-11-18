-- Threat: !InfrastructureShared
-- Name: !#Lua:Context/DllDroppedByNotepadpp
-- Type: 13
-- MpAttributes: MpNewlyCreatedHint & BM_MZ_DLL & MpOnOpenOrCloseRtpScan & RPF:TopLevelFile

local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
if l_0_0 == "notepad++.exe" then
  local l_0_1 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
  local l_0_2 = "DllDroppedByNotepadpp"
  local l_0_3 = MpCommon.QueryPersistContext(l_0_1, l_0_2)
  if not l_0_3 then
    MpCommon.AppendPersistContext(l_0_1, l_0_2, 100)
  end
  mp.set_mpattribute("MpDisableCaching")
  return mp.INFECTED
end
return mp.CLEAN
