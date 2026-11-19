-- Threat: !InfrastructureShared
-- Name: 447814fc057a
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
