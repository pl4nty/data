-- Threat: !InfrastructureShared
-- Name: 8378b8193a2c
-- Type: 21

if peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
