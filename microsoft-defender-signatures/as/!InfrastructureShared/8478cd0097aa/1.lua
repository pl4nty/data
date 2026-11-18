-- Threat: !InfrastructureShared
-- Name: 8478cd0097aa
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
