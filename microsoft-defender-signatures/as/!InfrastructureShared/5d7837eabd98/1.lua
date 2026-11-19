-- Threat: !InfrastructureShared
-- Name: 5d7837eabd98
-- Type: 21
-- Flags: 1

if pehdr.SizeOfImage == 245760 then
  return mp.INFECTED
end
mp.changedetectionname(805306372)
return mp.SUSPICIOUS
