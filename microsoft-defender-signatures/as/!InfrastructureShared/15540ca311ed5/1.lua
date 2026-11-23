-- Threat: !InfrastructureShared
-- Name: 15540ca311ed5
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
