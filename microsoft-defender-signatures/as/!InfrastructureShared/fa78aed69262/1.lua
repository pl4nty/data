-- Threat: !InfrastructureShared
-- Name: fa78aed69262
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
