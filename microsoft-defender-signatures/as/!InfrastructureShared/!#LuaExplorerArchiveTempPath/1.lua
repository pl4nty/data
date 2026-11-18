-- Threat: !InfrastructureShared
-- Name: !#Lua:ExplorerArchiveTempPath
-- Type: 12

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find("\\temp\\%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x_.+%.zip%.") ~= nil or l_0_0:find("\\temp\\temp[0-9]_.+%.zip$") ~= nil then
  mp.set_mpattribute("Lua:ExplorerArchiveTempPathZip")
end
return mp.CLEAN
