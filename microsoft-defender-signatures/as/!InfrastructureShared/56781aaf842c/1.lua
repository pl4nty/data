-- Threat: !InfrastructureShared
-- Name: 56781aaf842c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
