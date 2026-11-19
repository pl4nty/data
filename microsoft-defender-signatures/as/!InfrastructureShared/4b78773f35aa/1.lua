-- Threat: !InfrastructureShared
-- Name: 4b78773f35aa
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
