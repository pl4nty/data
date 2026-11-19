-- Threat: !InfrastructureShared
-- Name: 119616c1195f6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
