-- Threat: !InfrastructureShared
-- Name: 2f78c1746d9c
-- Type: 21

if peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
