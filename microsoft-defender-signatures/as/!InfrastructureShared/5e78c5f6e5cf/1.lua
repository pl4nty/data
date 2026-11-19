-- Threat: !InfrastructureShared
-- Name: 5e78c5f6e5cf
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
