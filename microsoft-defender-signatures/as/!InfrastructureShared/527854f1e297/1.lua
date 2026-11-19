-- Threat: !InfrastructureShared
-- Name: 527854f1e297
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() > 330000 and mp.getfilesize() < 380000 then
  return mp.INFECTED
end
return mp.CLEAN
