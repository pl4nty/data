-- Threat: !InfrastructureShared
-- Name: 5f780dec775f
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
