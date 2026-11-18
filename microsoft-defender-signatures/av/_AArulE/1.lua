-- Threat: \xadAArul.E
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & Lua:DATExt

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == "flobcsnd.dat" then
  return mp.INFECTED
end
return mp.CLEAN
