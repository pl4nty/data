-- Threat: !InfrastructureShared
-- Name: a678e7428559
-- Type: 21

if peattributes.isdll and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
