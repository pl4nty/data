-- Threat: !InfrastructureShared
-- Name: 2e78b6995437
-- Type: 21

if peattributes.x86_image == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
