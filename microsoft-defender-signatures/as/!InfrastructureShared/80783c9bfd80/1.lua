-- Threat: !InfrastructureShared
-- Name: 80783c9bfd80
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
