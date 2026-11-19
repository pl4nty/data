-- Threat: !InfrastructureShared
-- Name: f1785db00a8a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
