-- Threat: !InfrastructureShared
-- Name: 92788fc7dae6
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
