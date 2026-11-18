-- Threat: !#do_exhaustivehstr_rescan
-- Type: 10

local l_0_0 = mp.get_mpattribute("HSTR:TrojanSpy:Win32/Xtrat!classes")
local l_0_1 = mp.get_mpattribute("HSTR:TrojanSpy:Win32/Xtrat!id")
local l_0_2 = mp.get_mpattribute("HSTR:TrojanSpy:Win32/Xtrat!forms")
if l_0_0 or l_0_1 or l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
