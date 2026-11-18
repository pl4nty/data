-- Threat: !InfrastructureShared
-- Name: ab7808bcafba
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
