-- Threat: !InfrastructureShared
-- Name: 1b61751ea14d
-- Type: 21

local l_0_0 = mp.getfilesize()
if 589824 < l_0_0 and l_0_0 < 786432 and (mp.get_mpattribute("TEL:Trojan:Win32/Qakbot.E!sl1") or mp.get_mpattribute("TEL:Trojan:Win32/Qakbot.E!sl2")) then
  return mp.INFECTED
end
return mp.CLEAN
