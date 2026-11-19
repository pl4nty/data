-- Threat: !InfrastructureShared
-- Name: 5678f05d669c
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
