-- Threat: !InfrastructureShared
-- Name: b078e31879a1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
