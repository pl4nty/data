-- Threat: !InfrastructureShared
-- Name: 35781a1d5fc4
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
