-- Threat: !InfrastructureShared
-- Name: 6578b836c952
-- Type: 21

if peattributes.amd64_image and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
