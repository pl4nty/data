-- Threat: !InfrastructureShared
-- Name: 9d783f2a4fe2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
