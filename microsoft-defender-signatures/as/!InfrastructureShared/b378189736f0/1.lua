-- Threat: !InfrastructureShared
-- Name: b378189736f0
-- Type: 21

if pehdr.Subsystem == 1 then
  mp.changedetectionname(805306384)
  return mp.INFECTED
end
return mp.INFECTED
