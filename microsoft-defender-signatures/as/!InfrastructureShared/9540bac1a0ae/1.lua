-- Threat: !InfrastructureShared
-- Name: 9540bac1a0ae
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
