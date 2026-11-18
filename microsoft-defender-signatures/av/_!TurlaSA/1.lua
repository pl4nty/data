-- Threat: \xac!Turla.SA
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & Lua:FileInsideAppDataRoamingFolder & Lua:DBExt

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == "scawrdot.db" then
  return mp.INFECTED
end
return mp.CLEAN
