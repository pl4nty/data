-- Threat: !InfrastructureShared
-- Name: 4978ccf2b2a3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
