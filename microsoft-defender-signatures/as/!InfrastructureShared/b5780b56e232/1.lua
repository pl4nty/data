-- Threat: !InfrastructureShared
-- Name: b5780b56e232
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
