-- Threat: !InfrastructureShared
-- Name: 4078d44d6cea
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
