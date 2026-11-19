-- Threat: !InfrastructureShared
-- Name: dc78b1822c9c
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
