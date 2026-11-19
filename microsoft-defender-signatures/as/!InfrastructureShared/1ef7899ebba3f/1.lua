-- Threat: !InfrastructureShared
-- Name: 1ef7899ebba3f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
