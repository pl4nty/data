-- Threat: !InfrastructureShared
-- Name: 7e78bda58d31
-- Type: 21

if peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
