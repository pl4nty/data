-- Threat: !InfrastructureShared
-- Name: 78788dab6eab
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
