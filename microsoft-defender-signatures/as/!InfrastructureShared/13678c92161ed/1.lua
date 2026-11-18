-- Threat: !InfrastructureShared
-- Name: 13678c92161ed
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
