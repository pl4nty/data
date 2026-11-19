-- Threat: !InfrastructureShared
-- Name: 6778da525754
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
