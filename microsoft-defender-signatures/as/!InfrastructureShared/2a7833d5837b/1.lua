-- Threat: !InfrastructureShared
-- Name: 2a7833d5837b
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
