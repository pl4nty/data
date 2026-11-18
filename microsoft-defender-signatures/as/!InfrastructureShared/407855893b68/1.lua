-- Threat: !InfrastructureShared
-- Name: 407855893b68
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
