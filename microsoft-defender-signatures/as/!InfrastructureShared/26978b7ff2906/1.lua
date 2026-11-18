-- Threat: !InfrastructureShared
-- Name: 26978b7ff2906
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
