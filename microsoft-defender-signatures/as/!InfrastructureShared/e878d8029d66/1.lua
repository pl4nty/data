-- Threat: !InfrastructureShared
-- Name: e878d8029d66
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
