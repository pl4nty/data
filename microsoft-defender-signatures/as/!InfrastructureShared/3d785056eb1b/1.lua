-- Threat: !InfrastructureShared
-- Name: 3d785056eb1b
-- Type: 21

if peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
