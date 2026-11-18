-- Threat: !InfrastructureShared
-- Name: ae7804a4c7c1
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
