-- Threat: !InfrastructureShared
-- Name: 9678b94d1a96
-- Type: 21

if peattributes.isexe and peattributes.x86_image and peattributes.no_security and peattributes.requests_elevation then
  return mp.INFECTED
end
return mp.CLEAN
