-- Threat: !InfrastructureShared
-- Name: 9678556ee7b3
-- Type: 21

if peattributes.isdll == false and mp.getfilesize() < 1050000 then
  return mp.INFECTED
end
return mp.CLEAN
