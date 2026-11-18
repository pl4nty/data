-- Threat: !InfrastructureShared
-- Name: 42781e8fe31c
-- Type: 21

if pehdr.SizeOfImage > 135168 and pehdr.SizeOfImage < 143360 then
  return mp.INFECTED
end
return mp.CLEAN
