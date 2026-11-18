-- Threat: !InfrastructureShared
-- Name: ea781a8da8c0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
