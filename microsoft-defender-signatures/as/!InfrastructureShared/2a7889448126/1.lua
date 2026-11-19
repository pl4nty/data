-- Threat: !InfrastructureShared
-- Name: 2a7889448126
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
