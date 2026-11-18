-- Threat: !InfrastructureShared
-- Name: 71781033ab91
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
