-- Threat: !InfrastructureShared
-- Name: 10178c9fbf994
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
