-- Threat: !InfrastructureShared
-- Name: f478bb9c665b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
