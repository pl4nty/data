-- Threat: !InfrastructureShared
-- Name: 1e78bbb6ee71
-- Type: 21

local l_0_0 = mp.getfilesize()
if 86016 <= l_0_0 and l_0_0 <= 131072 and pehdr.NumberOfSections == 7 and mp.get_mpattribute("NID:TrojanSpy:Win32/Guildma.AB") then
  return mp.INFECTED
end
return mp.CLEAN
