-- Threat: !InfrastructureShared
-- Name: 607855ae873b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
