-- Threat: !InfrastructureShared
-- Name: 9540c146d7ca
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
