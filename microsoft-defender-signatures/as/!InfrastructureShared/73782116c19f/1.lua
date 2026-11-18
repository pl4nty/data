-- Threat: !InfrastructureShared
-- Name: 73782116c19f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
