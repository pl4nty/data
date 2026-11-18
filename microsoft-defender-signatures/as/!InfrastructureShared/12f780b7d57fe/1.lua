-- Threat: !InfrastructureShared
-- Name: 12f780b7d57fe
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
