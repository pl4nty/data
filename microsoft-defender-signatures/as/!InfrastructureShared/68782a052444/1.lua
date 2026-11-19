-- Threat: !InfrastructureShared
-- Name: 68782a052444
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
