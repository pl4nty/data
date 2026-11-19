-- Threat: !InfrastructureShared
-- Name: 7f785f529851
-- Type: 21

if pehdr.Subsystem == 1 then
  mp.changedetectionname(805306387)
  return mp.INFECTED
end
return mp.INFECTED
