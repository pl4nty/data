-- Threat: !InfrastructureShared
-- Name: 25293c58d493
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 ~= nil and string.find(l_0_0, "%.ttf$") then
  mp.set_mpattribute("LUA:Script/Cryxos.HAB4")
end
return mp.INFECTED
