-- Threat: !InfrastructureShared
-- Name: f9780d61276f
-- Type: 21

if mp.getfilesize() >= 851968 and mp.getfilesize() <= 917504 then
  return mp.INFECTED
end
return mp.CLEAN
