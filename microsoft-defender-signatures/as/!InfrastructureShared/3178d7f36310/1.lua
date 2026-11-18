-- Threat: !InfrastructureShared
-- Name: 3178d7f36310
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
