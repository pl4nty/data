-- Threat: !InfrastructureShared
-- Name: e77870cb4590
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
