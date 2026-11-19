-- Threat: !InfrastructureShared
-- Name: b6782ea1982a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
