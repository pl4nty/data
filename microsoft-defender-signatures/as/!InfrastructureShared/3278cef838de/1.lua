-- Threat: !InfrastructureShared
-- Name: 3278cef838de
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
