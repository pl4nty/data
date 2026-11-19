-- Threat: !InfrastructureShared
-- Name: 9c7824a6a48e
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
