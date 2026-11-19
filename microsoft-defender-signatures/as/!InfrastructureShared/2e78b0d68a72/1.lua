-- Threat: !InfrastructureShared
-- Name: 2e78b0d68a72
-- Type: 21

if pehdr.Subsystem == 1 then
  mp.changedetectionname(805306385)
  return mp.INFECTED
end
return mp.INFECTED
