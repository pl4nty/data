-- Threat: !InfrastructureShared
-- Name: e3782c68350a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
