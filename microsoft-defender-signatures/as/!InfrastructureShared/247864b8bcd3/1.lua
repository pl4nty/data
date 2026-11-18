-- Threat: !InfrastructureShared
-- Name: 247864b8bcd3
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
