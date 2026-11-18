-- Threat: !InfrastructureShared
-- Name: !#Lua:AndroidManifest
-- Type: 12
-- MpAttributes: Lua:XMLExt

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find("androidmanifest", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
