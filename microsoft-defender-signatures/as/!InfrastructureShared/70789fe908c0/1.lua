-- Threat: !InfrastructureShared
-- Name: 70789fe908c0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
