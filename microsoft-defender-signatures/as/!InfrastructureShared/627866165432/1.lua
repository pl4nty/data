-- Threat: !InfrastructureShared
-- Name: 627866165432
-- Type: 21

if peattributes.amd64_image and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
