-- Threat: !InfrastructureShared
-- Name: f078da515d95
-- Type: 21

if peattributes.isdll == true and peattributes.x86_image == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
