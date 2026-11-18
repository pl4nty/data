-- Threat: !InfrastructureShared
-- Name: e540df861acb
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
