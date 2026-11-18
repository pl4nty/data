-- Threat: \xac!Turla.SC
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & Lua:FileInsideUserPublicFolder & Lua:DATExt

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == "icore.dat" then
  return mp.INFECTED
end
return mp.CLEAN
