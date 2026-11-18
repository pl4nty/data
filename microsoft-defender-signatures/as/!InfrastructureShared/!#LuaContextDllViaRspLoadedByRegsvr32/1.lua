-- Threat: !InfrastructureShared
-- Name: !#Lua:Context/DllViaRspLoadedByRegsvr32
-- Type: 13
-- Includes: Path
-- MpAttributes: BM_MZ_DLL & MpOnOpenOrCloseRtpScan & RPF:TopLevelFile

local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
if l_0_0 ~= "odbcconf.exe" then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
local l_0_2 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
l_0_1 = normalize_path(l_0_1)
if MpCommon.QueryPersistContext(l_0_1, "DllFromRsp") then
  mp.set_mpattribute("Lua:Context/DllViaRspRegsvrLoad")
end
local l_0_3 = MpCommon.GetPersistContextNoPath("DllFromOdbcAction")
for l_0_4, l_0_5 in ipairs(l_0_3) do
  if l_0_5:find(l_0_2, 1, true) or l_0_5:find(l_0_1, 1, true) then
    mp.set_mpattribute("Lua:Context/DllViaOdbcconfLoad")
  end
end
return mp.CLEAN
