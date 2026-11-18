-- Threat: !InfrastructureShared
-- Name: 13178399fa81f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
