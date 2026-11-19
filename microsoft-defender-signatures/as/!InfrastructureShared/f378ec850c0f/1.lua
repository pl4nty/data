-- Threat: !InfrastructureShared
-- Name: f378ec850c0f
-- Type: 21

if mp.getfilesize() < 11000 then
  return mp.INFECTED
end
return mp.CLEAN
