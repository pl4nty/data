-- Threat: !InfrastructureShared
-- Name: 3478e5bcd184
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
