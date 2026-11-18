-- Threat: !InfrastructureShared
-- Name: 17061f280f838
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
