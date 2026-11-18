-- Threat: !InfrastructureShared
-- Name: 4e78d2413716
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
