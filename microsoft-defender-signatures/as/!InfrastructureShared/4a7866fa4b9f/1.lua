-- Threat: !InfrastructureShared
-- Name: 4a7866fa4b9f
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
