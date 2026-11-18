-- Threat: !InfrastructureShared
-- Name: 1107845f5a1cb
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
