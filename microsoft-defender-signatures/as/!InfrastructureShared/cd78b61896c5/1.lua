-- Threat: !InfrastructureShared
-- Name: cd78b61896c5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
