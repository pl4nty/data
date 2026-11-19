-- Threat: !InfrastructureShared
-- Name: cb787a157147
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
