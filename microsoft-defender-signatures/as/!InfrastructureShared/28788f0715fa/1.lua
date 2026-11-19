-- Threat: !InfrastructureShared
-- Name: 28788f0715fa
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
