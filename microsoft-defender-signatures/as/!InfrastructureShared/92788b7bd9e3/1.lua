-- Threat: !InfrastructureShared
-- Name: 92788b7bd9e3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
