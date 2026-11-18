-- Threat: !InfrastructureShared
-- Name: 14d78c3dfa629
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
