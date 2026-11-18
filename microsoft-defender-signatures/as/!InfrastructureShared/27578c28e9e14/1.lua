-- Threat: !InfrastructureShared
-- Name: 27578c28e9e14
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
