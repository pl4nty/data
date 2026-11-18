-- Threat: !InfrastructureShared
-- Name: 3b7854f28d8a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
