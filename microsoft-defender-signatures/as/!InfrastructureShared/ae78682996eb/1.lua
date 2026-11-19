-- Threat: !InfrastructureShared
-- Name: ae78682996eb
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
