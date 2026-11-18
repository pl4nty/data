-- Threat: !InfrastructureShared
-- Name: 497874e7cb1a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
