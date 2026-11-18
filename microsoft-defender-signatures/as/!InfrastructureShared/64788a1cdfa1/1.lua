-- Threat: !InfrastructureShared
-- Name: 64788a1cdfa1
-- Type: 21

if peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
