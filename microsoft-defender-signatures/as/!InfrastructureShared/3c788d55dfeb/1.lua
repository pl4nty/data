-- Threat: !InfrastructureShared
-- Name: 3c788d55dfeb
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
