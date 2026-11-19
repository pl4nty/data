-- Threat: !InfrastructureShared
-- Name: e87899f035e3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
