-- Threat: !InfrastructureShared
-- Name: 11578efc4b65e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
