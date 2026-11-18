-- Threat: !InfrastructureShared
-- Name: 4878dd3b30cf
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
