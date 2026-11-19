-- Threat: !InfrastructureShared
-- Name: 787872cf4afd
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
