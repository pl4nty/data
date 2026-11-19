-- Threat: !InfrastructureShared
-- Name: 2278b9a639b3
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and peattributes.amd64_image == true then
  return mp.INFECTED
end
return mp.CLEAN
