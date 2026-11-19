-- Threat: !InfrastructureShared
-- Name: 527846ff1961
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
