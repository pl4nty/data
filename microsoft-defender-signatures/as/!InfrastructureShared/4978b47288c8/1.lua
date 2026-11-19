-- Threat: !InfrastructureShared
-- Name: 4978b47288c8
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
