-- Threat: !InfrastructureShared
-- Name: 617890c43e8b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
