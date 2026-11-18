-- Threat: !InfrastructureShared
-- Name: 3878f53e3eee
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
