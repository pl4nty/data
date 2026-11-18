-- Threat: !InfrastructureShared
-- Name: 22781a755304
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
