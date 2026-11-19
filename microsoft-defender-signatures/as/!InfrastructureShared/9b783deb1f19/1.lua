-- Threat: !InfrastructureShared
-- Name: 9b783deb1f19
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
