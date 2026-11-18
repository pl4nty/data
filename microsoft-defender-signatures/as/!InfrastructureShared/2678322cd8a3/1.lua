-- Threat: !InfrastructureShared
-- Name: 2678322cd8a3
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
