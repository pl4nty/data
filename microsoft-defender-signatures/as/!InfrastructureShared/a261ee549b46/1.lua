-- Threat: !InfrastructureShared
-- Name: a261ee549b46
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
