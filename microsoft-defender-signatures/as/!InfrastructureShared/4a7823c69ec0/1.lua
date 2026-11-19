-- Threat: !InfrastructureShared
-- Name: 4a7823c69ec0
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
