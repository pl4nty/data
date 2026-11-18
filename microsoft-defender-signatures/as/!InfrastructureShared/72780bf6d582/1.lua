-- Threat: !InfrastructureShared
-- Name: 72780bf6d582
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
