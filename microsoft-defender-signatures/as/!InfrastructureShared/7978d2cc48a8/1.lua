-- Threat: !InfrastructureShared
-- Name: 7978d2cc48a8
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
