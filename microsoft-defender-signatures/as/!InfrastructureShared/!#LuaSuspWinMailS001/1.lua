-- Threat: !InfrastructureShared
-- Name: !#Lua:Susp.WinMail.S001
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & Lua:FileInsideAppDataLocalTempFolder & Lua:DATExt & !BM_TNEF_FILE

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == "winmail.dat" then
  return mp.INFECTED
end
return mp.CLEAN
