-- Threat: !InfrastructureShared
-- Name: 53781b9fecba
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
