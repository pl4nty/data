-- Threat: !InfrastructureShared
-- Name: 1657851190eb3
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
