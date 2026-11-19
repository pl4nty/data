-- Threat: !InfrastructureShared
-- Name: 72781e45b2e2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
