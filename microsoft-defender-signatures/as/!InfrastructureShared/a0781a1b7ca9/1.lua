-- Threat: !InfrastructureShared
-- Name: a0781a1b7ca9
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
