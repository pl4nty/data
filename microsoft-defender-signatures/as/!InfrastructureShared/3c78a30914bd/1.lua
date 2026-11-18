-- Threat: !InfrastructureShared
-- Name: 3c78a30914bd
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
