-- Threat: !InfrastructureShared
-- Name: !#Lua:SuspLoaderBatFile
-- Type: 13
-- MpAttributes: Lua:BATExt

local l_0_0 = mp.getfilesize()
if l_0_0 < 100000 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == "loader.bat" then
  return mp.INFECTED
end
return mp.CLEAN
