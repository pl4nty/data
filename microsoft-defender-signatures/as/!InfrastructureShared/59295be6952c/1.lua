-- Threat: !InfrastructureShared
-- Name: 59295be6952c
-- Type: 21

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if string.find(l_0_0, "drawing1.xml.rels") ~= nil and mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
