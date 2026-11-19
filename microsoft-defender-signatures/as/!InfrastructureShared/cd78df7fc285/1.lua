-- Threat: !InfrastructureShared
-- Name: cd78df7fc285
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
