-- Threat: !InfrastructureShared
-- Name: 4a7801289437
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
