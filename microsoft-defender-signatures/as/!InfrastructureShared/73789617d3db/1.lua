-- Threat: !InfrastructureShared
-- Name: 73789617d3db
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
