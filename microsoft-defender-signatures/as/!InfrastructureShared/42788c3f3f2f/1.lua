-- Threat: !InfrastructureShared
-- Name: 42788c3f3f2f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
