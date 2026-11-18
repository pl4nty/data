-- Threat: !InfrastructureShared
-- Name: 7378df79e59d
-- Type: 21

if peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
