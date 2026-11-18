-- Threat: !InfrastructureShared
-- Name: 547820a45bb0
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
