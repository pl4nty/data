-- Threat: !InfrastructureShared
-- Name: 3a78f48af9b5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
