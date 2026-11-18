-- Threat: !InfrastructureShared
-- Name: 9678c52ae75c
-- Type: 21

if pehdr.SizeOfImage > 56320 and pehdr.SizeOfImage < 57856 then
  return mp.INFECTED
end
return mp.CLEAN
