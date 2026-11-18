-- Threat: !InfrastructureShared
-- Name: 3f780a614749
-- Type: 21

if peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
