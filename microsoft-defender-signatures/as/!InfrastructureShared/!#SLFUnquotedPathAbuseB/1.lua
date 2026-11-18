-- Threat: !InfrastructureShared
-- Name: !#SLF:UnquotedPathAbuse.B
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & pea_isexe & Lua:TopLevelUnsigned

if not mp.get_mpattribute("Lua:LastFolder0!c:") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == "program.exe" then
  return mp.INFECTED
end
return mp.CLEAN
