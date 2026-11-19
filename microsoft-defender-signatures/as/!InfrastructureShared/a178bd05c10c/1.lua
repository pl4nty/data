-- Threat: !InfrastructureShared
-- Name: a178bd05c10c
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
