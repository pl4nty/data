-- Threat: !InfrastructureShared
-- Name: d278e2fafc88
-- Type: 21

mp.readprotection(false)
local l_0_0 = pe.foffset_va(hstrlog[1].VA + 45)
local l_0_1 = mp.readfile(l_0_0, 4)
local l_0_2 = pe.foffset_va(mp.readu_u32(l_0_1, 1))
local l_0_3 = mp.readfile(l_0_2, 15)
if l_0_3 == "D\000e\000l\000e\000t\000e\000d\000\000" then
  mp.set_mpattribute("HSTR:BingSearchCby")
end
return mp.CLEAN
