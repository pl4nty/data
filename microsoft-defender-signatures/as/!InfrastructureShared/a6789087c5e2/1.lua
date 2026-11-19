-- Threat: !InfrastructureShared
-- Name: a6789087c5e2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
