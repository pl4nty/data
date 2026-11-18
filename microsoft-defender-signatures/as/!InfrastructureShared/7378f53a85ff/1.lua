-- Threat: !InfrastructureShared
-- Name: 7378f53a85ff
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
