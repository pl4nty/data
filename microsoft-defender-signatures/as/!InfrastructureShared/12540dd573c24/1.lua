-- Threat: !InfrastructureShared
-- Name: 12540dd573c24
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
