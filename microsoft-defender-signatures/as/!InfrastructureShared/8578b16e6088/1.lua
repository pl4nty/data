-- Threat: !InfrastructureShared
-- Name: 8578b16e6088
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
