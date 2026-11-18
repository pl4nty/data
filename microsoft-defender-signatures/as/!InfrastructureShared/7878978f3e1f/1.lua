-- Threat: !InfrastructureShared
-- Name: 7878978f3e1f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
