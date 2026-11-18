-- Threat: !InfrastructureShared
-- Name: d3788a787723
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
