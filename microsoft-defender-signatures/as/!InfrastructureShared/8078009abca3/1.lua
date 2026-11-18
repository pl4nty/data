-- Threat: !InfrastructureShared
-- Name: 8078009abca3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
