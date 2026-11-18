-- Threat: !InfrastructureShared
-- Name: 33782a37b4bb
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
