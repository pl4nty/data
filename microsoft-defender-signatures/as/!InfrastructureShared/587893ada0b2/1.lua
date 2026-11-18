-- Threat: !InfrastructureShared
-- Name: 587893ada0b2
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
