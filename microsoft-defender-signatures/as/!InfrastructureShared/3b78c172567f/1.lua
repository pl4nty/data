-- Threat: !InfrastructureShared
-- Name: 3b78c172567f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
