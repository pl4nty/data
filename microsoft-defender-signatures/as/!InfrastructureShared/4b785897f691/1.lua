-- Threat: !InfrastructureShared
-- Name: 4b785897f691
-- Type: 21

if peattributes.isdll and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
