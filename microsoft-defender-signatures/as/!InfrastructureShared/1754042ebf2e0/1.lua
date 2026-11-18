-- Threat: !InfrastructureShared
-- Name: 1754042ebf2e0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
