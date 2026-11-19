-- Threat: !InfrastructureShared
-- Name: e4785a448532
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
