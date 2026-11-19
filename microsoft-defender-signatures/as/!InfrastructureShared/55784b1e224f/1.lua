-- Threat: !InfrastructureShared
-- Name: 55784b1e224f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
