-- Threat: !InfrastructureShared
-- Name: 797802658311
-- Type: 21

if peattributes.isexe and peattributes.ismsil == false then
  return mp.INFECTED
end
return mp.CLEAN
