-- Threat: !InfrastructureShared
-- Name: 43787601daa5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
