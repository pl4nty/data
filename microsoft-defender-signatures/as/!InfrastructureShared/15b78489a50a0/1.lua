-- Threat: !InfrastructureShared
-- Name: 15b78489a50a0
-- Type: 21

if pehdr.NumberOfSections == 3 and peattributes.epinfirstsect and pesecs[pehdr.NumberOfSections].Name == ".rsrc" then
  return mp.INFECTED
end
return mp.CLEAN
