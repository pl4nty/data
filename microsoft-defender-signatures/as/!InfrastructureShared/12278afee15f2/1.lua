-- Threat: !InfrastructureShared
-- Name: 12278afee15f2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
