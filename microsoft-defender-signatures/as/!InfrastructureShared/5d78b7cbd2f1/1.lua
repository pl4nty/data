-- Threat: !InfrastructureShared
-- Name: 5d78b7cbd2f1
-- Type: 21

if peattributes.amd64_image and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
