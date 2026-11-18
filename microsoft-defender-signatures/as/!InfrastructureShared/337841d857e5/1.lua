-- Threat: !InfrastructureShared
-- Name: 337841d857e5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
