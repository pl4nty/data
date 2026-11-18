-- Threat: !InfrastructureShared
-- Name: 4b78d8ecf353
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
