-- Threat: !InfrastructureShared
-- Name: 767851b0bae5
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
