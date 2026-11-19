-- Threat: !InfrastructureShared
-- Name: c478c3ab56be
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
