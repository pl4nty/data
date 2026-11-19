-- Threat: !InfrastructureShared
-- Name: c3784e4757f3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
