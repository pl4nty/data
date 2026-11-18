-- Threat: !InfrastructureShared
-- Name: 6b785bc5765c
-- Type: 21

local l_0_0 = mp.getfilesize()
if 290816 <= l_0_0 and l_0_0 <= 299008 and mp.get_mpattribute("ALF:Trojan:Win32/IcedId.PJ!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
