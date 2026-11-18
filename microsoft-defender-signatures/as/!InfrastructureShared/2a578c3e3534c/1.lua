-- Threat: !InfrastructureShared
-- Name: 2a578c3e3534c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
