-- Threat: !InfrastructureShared
-- Name: d5409cf2a678
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
