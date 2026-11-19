-- Threat: !InfrastructureShared
-- Name: 5d78a874152f
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
