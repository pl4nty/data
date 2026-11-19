-- Threat: !InfrastructureShared
-- Name: c96116731d3b
-- Type: 21

if peattributes.isvbnative == true and peattributes.no_security == true and mp.getfilesize() < 2097152 then
  return mp.INFECTED
end
return mp.CLEAN
