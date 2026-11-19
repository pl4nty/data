-- Threat: !InfrastructureShared
-- Name: 8778fceb8280
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() > 2900 then
  return mp.INFECTED
end
return mp.CLEAN
