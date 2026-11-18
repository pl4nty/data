-- Threat: !InfrastructureShared
-- Name: 3178bad4c5a0
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 <= 2097152 then
  return mp.INFECTED
end
mp.set_mpattribute("ALF:Trojan:Win32/GenMal.A")
return mp.CLEAN
