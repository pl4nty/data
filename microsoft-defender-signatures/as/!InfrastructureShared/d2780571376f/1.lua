-- Threat: !InfrastructureShared
-- Name: d2780571376f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
