-- Threat: !InfrastructureShared
-- Name: 12540c60d5d5e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
