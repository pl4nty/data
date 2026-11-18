-- Threat: !InfrastructureShared
-- Name: e77868376b12
-- Type: 21

if peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
