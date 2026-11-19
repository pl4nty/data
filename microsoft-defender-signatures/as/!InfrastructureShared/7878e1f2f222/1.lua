-- Threat: !InfrastructureShared
-- Name: 7878e1f2f222
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
