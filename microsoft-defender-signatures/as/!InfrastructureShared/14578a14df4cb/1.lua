-- Threat: !InfrastructureShared
-- Name: 14578a14df4cb
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() > 30000000 and pehdr.Magic == 523 then
  return mp.INFECTED
end
return mp.CLEAN
