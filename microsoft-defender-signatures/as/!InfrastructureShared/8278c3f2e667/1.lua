-- Threat: !InfrastructureShared
-- Name: 8278c3f2e667
-- Type: 21

if peattributes.no_security == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
