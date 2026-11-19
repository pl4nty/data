-- Threat: !InfrastructureShared
-- Name: 72781402b9db
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
