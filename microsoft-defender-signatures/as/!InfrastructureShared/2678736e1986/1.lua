-- Threat: !InfrastructureShared
-- Name: 2678736e1986
-- Type: 21

if peattributes.isdll and mp.getfilesize() < 13500 then
  return mp.INFECTED
end
return mp.CLEAN
