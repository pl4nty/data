-- Threat: !InfrastructureShared
-- Name: a17857a8da44
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
