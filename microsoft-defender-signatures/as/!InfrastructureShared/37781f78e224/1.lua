-- Threat: !InfrastructureShared
-- Name: 37781f78e224
-- Type: 21

if peattributes.x86_image == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
