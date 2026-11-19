-- Threat: !InfrastructureShared
-- Name: 7078838cc2ff
-- Type: 21
-- Flags: 1

local l_0_0 = pevars.epsec
if pevars.epsec and pesecs[l_0_0].SizeOfRawData >= 40960 and pesecs[l_0_0].SizeOfRawData <= 131072 and pehdr.SizeOfImage >= 65536 and pehdr.SizeOfImage <= 1044480 then
  mp.changedetectionname(805306422)
  return mp.INFECTED
end
return mp.SUSPICIOUS
