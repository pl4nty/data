-- Threat: !InfrastructureShared
-- Name: 4078d9d62e71
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
