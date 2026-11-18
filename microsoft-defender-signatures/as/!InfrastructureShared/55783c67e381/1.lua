-- Threat: !InfrastructureShared
-- Name: 55783c67e381
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
