-- Threat: !InfrastructureShared
-- Name: 4578aab1348a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
