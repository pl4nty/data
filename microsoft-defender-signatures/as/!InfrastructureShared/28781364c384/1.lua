-- Threat: !InfrastructureShared
-- Name: 28781364c384
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
