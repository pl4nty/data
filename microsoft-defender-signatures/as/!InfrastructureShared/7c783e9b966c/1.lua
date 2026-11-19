-- Threat: !InfrastructureShared
-- Name: 7c783e9b966c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
