-- Threat: !InfrastructureShared
-- Name: 57786381bed9
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
