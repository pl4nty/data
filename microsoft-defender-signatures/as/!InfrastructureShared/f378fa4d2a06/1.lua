-- Threat: !InfrastructureShared
-- Name: f378fa4d2a06
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
