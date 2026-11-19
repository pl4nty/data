-- Threat: !InfrastructureShared
-- Name: 17a78c2a5b366
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
