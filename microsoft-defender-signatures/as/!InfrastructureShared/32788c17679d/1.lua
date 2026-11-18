-- Threat: !InfrastructureShared
-- Name: 32788c17679d
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
