-- Threat: !InfrastructureShared
-- Name: 654049f20396
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
