-- Threat: !InfrastructureShared
-- Name: ac78447f09e0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
