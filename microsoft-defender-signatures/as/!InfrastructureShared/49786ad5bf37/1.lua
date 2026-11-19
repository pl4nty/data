-- Threat: !InfrastructureShared
-- Name: 49786ad5bf37
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
