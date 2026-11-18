-- Threat: !InfrastructureShared
-- Name: 8f78499f56dc
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
