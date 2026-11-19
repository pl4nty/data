-- Threat: !InfrastructureShared
-- Name: 12478858f7a28
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
