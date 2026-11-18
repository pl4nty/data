-- Threat: !InfrastructureShared
-- Name: 8c78c7a8b581
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
