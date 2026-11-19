-- Threat: !InfrastructureShared
-- Name: 9f78b913b1d4
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
