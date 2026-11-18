-- Threat: !InfrastructureShared
-- Name: 2e784051b232
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
