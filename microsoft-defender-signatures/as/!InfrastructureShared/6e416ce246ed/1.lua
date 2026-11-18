-- Threat: !InfrastructureShared
-- Name: 6e416ce246ed
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
