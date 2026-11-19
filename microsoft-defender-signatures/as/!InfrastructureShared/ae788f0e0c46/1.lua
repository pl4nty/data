-- Threat: !InfrastructureShared
-- Name: ae788f0e0c46
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
