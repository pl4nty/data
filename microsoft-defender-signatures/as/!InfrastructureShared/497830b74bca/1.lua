-- Threat: !InfrastructureShared
-- Name: 497830b74bca
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
