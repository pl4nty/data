-- Threat: !InfrastructureShared
-- Name: 207851d97955
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
