-- Threat: !InfrastructureShared
-- Name: 1ba782ac9e312
-- Type: 21
-- Flags: 1

if pehdr.SizeOfImage > 720896 and pehdr.SizeOfImage < 917504 then
  mp.changedetectionname(268436329)
  return mp.INFECTED
end
return mp.SUSPICIOUS
