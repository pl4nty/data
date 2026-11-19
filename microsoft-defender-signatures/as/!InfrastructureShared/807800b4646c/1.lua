-- Threat: !InfrastructureShared
-- Name: 807800b4646c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
