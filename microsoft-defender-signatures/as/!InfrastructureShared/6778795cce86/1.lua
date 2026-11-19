-- Threat: !InfrastructureShared
-- Name: 6778795cce86
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
