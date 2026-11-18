-- Threat: !InfrastructureShared
-- Name: !#MSIBinaryChecks
-- Type: 10
-- MpAttributes: BM_MZ_FILE & //BM_OLE_FILE_CONTAINER

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = string.match(l_0_0, "%->binary%.(.+)$")
if not l_0_0 then
  return mp.CLEAN
end
if string.find(l_0_0, ".", 1, true) == nil then
  mp.set_mpattribute("Lua:MSIBinaryWithNoExtension")
end
if not l_0_0 or l_0_0 == "" then
  return mp.CLEAN
end
mp.set_mpattribute("//Lua:MSIBinary:" .. l_0_0)
return mp.CLEAN
