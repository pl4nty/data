-- Threat: !InfrastructureShared
-- Name: 13f619f86d48c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
