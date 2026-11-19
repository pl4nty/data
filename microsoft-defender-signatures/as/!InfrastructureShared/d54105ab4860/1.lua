-- Threat: !InfrastructureShared
-- Name: d54105ab4860
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
