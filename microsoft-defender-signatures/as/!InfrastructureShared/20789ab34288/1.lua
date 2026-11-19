-- Threat: !InfrastructureShared
-- Name: 20789ab34288
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
