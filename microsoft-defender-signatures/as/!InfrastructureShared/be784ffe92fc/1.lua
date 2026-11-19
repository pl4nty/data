-- Threat: !InfrastructureShared
-- Name: be784ffe92fc
-- Type: 21

if peattributes.isdll and mp.getfilesize() < 200000 then
  return mp.INFECTED
end
return mp.CLEAN
