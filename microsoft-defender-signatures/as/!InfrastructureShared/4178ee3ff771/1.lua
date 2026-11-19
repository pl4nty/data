-- Threat: !InfrastructureShared
-- Name: 4178ee3ff771
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
