-- Threat: !InfrastructureShared
-- Name: 6961635bb3be
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
