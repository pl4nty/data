-- Threat: !InfrastructureShared
-- Name: 3b780dfbcac8
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
