-- Threat: !InfrastructureShared
-- Name: 10278793744e7
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
