-- Threat: !InfrastructureShared
-- Name: 73781ca9901b
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
