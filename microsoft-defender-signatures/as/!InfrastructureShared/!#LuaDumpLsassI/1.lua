-- Threat: !InfrastructureShared
-- Name: !#Lua:DumpLsass.I
-- Type: 12
-- MpAttributes: RPF:TopLevelFile & MpNewlyCreatedHint & BM_MEMDUMP_FILE

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or #l_0_0 < 9 then
  return mp.CLEAN
end
if l_0_0 == "lsass.dmp" then
  return mp.INFECTED
end
if string.sub(l_0_0, -5) == ").dmp" and string.sub(l_0_0, 1, 7) == "lsass (" then
  return mp.INFECTED
end
return mp.CLEAN
