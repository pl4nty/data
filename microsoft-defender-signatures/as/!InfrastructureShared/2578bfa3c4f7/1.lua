-- Threat: !InfrastructureShared
-- Name: 2578bfa3c4f7
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
