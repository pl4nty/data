-- Threat: !InfrastructureShared
-- Name: 11c782218bd47
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
