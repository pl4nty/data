-- Threat: !#do_exhaustivehstr_rescan
-- Type: 10

local l_0_0 = mp.get_mpattribute("HSTR:TrojanSpy:Win32/Ranbyus!obf")
local l_0_1 = mp.get_mpattribute("HSTR:Worm:Win32/Rebhip!encrsrc")
local l_0_2 = mp.get_mpattribute("HSTR:VirTool:Win32/VBInject.ADR")
local l_0_3 = mp.get_mpattribute("HSTR:VirTool:Win32/VBInject.ADS")
if l_0_0 or l_0_1 or l_0_2 or l_0_3 then
  return mp.INFECTED
end
return mp.CLEAN
