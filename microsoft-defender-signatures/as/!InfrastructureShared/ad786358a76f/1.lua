-- Threat: !InfrastructureShared
-- Name: ad786358a76f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
