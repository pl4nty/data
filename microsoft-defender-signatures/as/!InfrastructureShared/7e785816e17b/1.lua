-- Threat: !InfrastructureShared
-- Name: 7e785816e17b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
