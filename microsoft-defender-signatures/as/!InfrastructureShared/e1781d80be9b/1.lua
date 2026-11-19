-- Threat: !InfrastructureShared
-- Name: e1781d80be9b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
