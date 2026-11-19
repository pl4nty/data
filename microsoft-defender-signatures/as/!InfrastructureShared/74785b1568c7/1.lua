-- Threat: !InfrastructureShared
-- Name: 74785b1568c7
-- Type: 21

if peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
