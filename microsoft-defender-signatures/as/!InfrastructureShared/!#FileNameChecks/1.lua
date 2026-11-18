-- Threat: !InfrastructureShared
-- Name: !#FileNameChecks
-- Type: 10
-- MpAttributes: RPF:TopLevelFile & BM_MZ_FILE & Lua:FileSizeGEC350

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = {
  ["avira.oe.nativecore.dll"] = "AviraOeNativeCoreDll",
  ["wsc.dll"] = "AvgWscDll"
}
local l_0_2 = l_0_1[l_0_0]
if l_0_2 then
  mp.set_mpattribute(string.format("Lua:FileName%s", l_0_2))
end
return mp.CLEAN
