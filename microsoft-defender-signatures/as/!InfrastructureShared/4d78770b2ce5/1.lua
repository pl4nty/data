-- Threat: !InfrastructureShared
-- Name: 4d78770b2ce5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
