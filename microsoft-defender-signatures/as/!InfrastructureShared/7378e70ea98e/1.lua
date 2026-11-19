-- Threat: !InfrastructureShared
-- Name: 7378e70ea98e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
