-- Threat: !InfrastructureShared
-- Name: 1757832fe9410
-- Type: 21

local l_0_0 = string.lower(mp.getfilename())
if string.match(l_0_0, "appdata\\local\\temp\\bk[%a%d]+.tmp\\p[%a%d]+.exe") then
  mp.set_mpattribute("HSTR:Win32/PCHunter.B")
end
return mp.INFECTED
