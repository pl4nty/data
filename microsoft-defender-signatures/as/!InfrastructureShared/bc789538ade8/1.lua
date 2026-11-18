-- Threat: !InfrastructureShared
-- Name: bc789538ade8
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
