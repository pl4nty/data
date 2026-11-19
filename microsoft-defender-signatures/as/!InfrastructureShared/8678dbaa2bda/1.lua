-- Threat: !InfrastructureShared
-- Name: 8678dbaa2bda
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
