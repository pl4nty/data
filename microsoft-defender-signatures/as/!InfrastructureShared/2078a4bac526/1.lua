-- Threat: !InfrastructureShared
-- Name: 2078a4bac526
-- Type: 21

if peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
