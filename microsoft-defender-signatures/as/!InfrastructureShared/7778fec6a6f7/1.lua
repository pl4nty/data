-- Threat: !InfrastructureShared
-- Name: 7778fec6a6f7
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
