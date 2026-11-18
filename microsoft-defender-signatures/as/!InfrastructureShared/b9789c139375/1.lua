-- Threat: !InfrastructureShared
-- Name: b9789c139375
-- Type: 21

local l_0_0 = mp.getfilesize()
if 28672 < l_0_0 and l_0_0 < 40960 and pehdr.NumberOfSections == 1 and pesecs[pevars.epsec].Name == ".text" then
  return mp.INFECTED
end
return mp.CLEAN
