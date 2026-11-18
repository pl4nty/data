-- Threat: !InfrastructureShared
-- Name: 3a7875077c2a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
