-- Threat: !InfrastructureShared
-- Name: 4178f747c35e
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
