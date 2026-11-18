-- Threat: !InfrastructureShared
-- Name: 13b78c29d29ba
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
