-- Threat: !InfrastructureShared
-- Name: 96781ea47472
-- Type: 21

if peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
