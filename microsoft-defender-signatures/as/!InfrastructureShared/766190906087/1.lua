-- Threat: !InfrastructureShared
-- Name: 766190906087
-- Type: 21
-- Flags: 1

if pehdr.SizeOfImage > 393216 and pehdr.SizeOfImage < 458752 then
  mp.changedetectionname(805306399)
  return mp.INFECTED
end
return mp.SUSPICIOUS
