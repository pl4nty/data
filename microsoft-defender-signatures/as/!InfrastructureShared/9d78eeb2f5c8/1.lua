-- Threat: !InfrastructureShared
-- Name: 9d78eeb2f5c8
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 1000000 then
  return mp.INFECTED
end
return mp.CLEAN
