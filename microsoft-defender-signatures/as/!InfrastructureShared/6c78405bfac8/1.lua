-- Threat: !InfrastructureShared
-- Name: 6c78405bfac8
-- Type: 21

if peattributes.no_security and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
