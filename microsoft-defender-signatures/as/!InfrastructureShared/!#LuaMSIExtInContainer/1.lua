-- Threat: !InfrastructureShared
-- Name: !#Lua:MSIExtInContainer
-- Type: 12
-- MpAttributes: BM_OLE_FILE & !RPF:TopLevelFile

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:len() > 4 and string.sub(l_0_0, -4) == ".msi" then
  mp.set_mpattribute("Lua:MSIExtInContainer")
end
return mp.CLEAN
