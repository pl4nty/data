-- Threat: !InfrastructureShared
-- Name: 8178e7ad2217
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
