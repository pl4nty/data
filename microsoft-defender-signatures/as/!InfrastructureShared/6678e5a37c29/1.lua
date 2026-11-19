-- Threat: !InfrastructureShared
-- Name: 6678e5a37c29
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
