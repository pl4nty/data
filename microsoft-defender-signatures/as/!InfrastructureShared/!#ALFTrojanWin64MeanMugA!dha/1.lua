-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win64/MeanMug.A!dha
-- Type: 24
-- MpAttributes: HEUR:VmProtSspDll.A

local l_0_0 = mp.getfilesize()
if l_0_0 < 1100000 or 1400000 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
