-- Threat: !InfrastructureShared
-- Name: 53781223f900
-- Type: 21

if peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
