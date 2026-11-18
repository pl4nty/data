-- Threat: !InfrastructureShared
-- Name: b37833e95d98
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
