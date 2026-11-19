-- Threat: !InfrastructureShared
-- Name: 3e7897a96edf
-- Type: 21

if peattributes.no_security == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
