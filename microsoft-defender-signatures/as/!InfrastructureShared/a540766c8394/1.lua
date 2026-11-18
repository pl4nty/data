-- Threat: !InfrastructureShared
-- Name: a540766c8394
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
