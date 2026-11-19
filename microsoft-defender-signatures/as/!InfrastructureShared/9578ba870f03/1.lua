-- Threat: !InfrastructureShared
-- Name: 9578ba870f03
-- Type: 21

local l_0_0 = mp.getfilesize()
if 135000 < l_0_0 and l_0_0 < 150000 and pehdr.NumberOfSections >= 6 and pesecs[3].Name == ".zfq" and pesecs[4].Name == ".flq" then
  return mp.INFECTED
end
return mp.CLEAN
