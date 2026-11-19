-- Threat: !InfrastructureShared
-- Name: 14178b3bbe53f
-- Type: 21

local l_0_0 = string.lower(mp.getfilename())
if string.sub(l_0_0, -9) == "setup.exe" then
  mp.set_mpattribute("HSTR:Win32/BrowseFox.V!Setup")
end
mp.set_mpattribute("PUA:Block:BrowseFox")
return mp.INFECTED
