-- Threat: !InfrastructureShared
-- Name: fb78c699382e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
