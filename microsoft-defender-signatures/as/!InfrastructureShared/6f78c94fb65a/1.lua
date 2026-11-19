-- Threat: !InfrastructureShared
-- Name: 6f78c94fb65a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
