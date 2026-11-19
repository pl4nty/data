-- Threat: !InfrastructureShared
-- Name: 9f78ad705e4d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
