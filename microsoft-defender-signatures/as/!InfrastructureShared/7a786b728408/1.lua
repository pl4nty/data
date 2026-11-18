-- Threat: !InfrastructureShared
-- Name: 7a786b728408
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
