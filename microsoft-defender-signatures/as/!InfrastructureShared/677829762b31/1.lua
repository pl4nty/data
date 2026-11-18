-- Threat: !InfrastructureShared
-- Name: 677829762b31
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
