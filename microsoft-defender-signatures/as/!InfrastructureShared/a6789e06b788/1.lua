-- Threat: !InfrastructureShared
-- Name: a6789e06b788
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
