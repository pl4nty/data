-- Threat: !InfrastructureShared
-- Name: 7540db2a46fb
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == false then
  return mp.INFECTED
end
return mp.CLEAN
