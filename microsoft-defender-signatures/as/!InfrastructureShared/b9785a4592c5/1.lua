-- Threat: !InfrastructureShared
-- Name: b9785a4592c5
-- Type: 21

if peattributes.isexe and pehdr.NumberOfSections == 3 and pesecs[3].VirtualSize >= 2176 and pesecs[3].VirtualSize <= 4096 and pehdr.SizeOfImage >= 20480 and pehdr.SizeOfImage <= 36864 then
  return mp.INFECTED
end
return mp.CLEAN
