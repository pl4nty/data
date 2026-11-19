-- Threat: !InfrastructureShared
-- Name: 237826c876d4
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() > 5600000 and mp.getfilesize() < 5700000 then
  return mp.INFECTED
end
return mp.CLEAN
