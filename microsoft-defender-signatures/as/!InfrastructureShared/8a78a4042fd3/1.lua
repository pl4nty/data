-- Threat: !InfrastructureShared
-- Name: 8a78a4042fd3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
