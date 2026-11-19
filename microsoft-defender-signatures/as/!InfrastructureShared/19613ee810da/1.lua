-- Threat: !InfrastructureShared
-- Name: 19613ee810da
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
