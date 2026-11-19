-- Threat: !InfrastructureShared
-- Name: 3c78ee3ef91d
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
