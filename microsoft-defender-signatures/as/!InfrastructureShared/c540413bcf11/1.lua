-- Threat: !InfrastructureShared
-- Name: c540413bcf11
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
