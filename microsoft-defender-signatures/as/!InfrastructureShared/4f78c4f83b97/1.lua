-- Threat: !InfrastructureShared
-- Name: 4f78c4f83b97
-- Type: 21

if peattributes.x86_image == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
