-- Threat: \xac!Turla.SB
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & Lua:TLBExt

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == "mapid.tlb" then
  return mp.INFECTED
end
return mp.CLEAN
