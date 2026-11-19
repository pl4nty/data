-- Threat: !InfrastructureShared
-- Name: c5409758f803
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
