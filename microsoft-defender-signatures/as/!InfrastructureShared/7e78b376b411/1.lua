-- Threat: !InfrastructureShared
-- Name: 7e78b376b411
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
