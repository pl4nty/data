-- Threat: !InfrastructureShared
-- Name: 57786432208a
-- Type: 21

if peattributes.isexe and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
