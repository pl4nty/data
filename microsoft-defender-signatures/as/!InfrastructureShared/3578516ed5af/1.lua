-- Threat: !InfrastructureShared
-- Name: 3578516ed5af
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
