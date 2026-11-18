-- Threat: !InfrastructureShared
-- Name: 1a1b37c583523
-- Type: 21
-- Includes: LuaFuncHelper, BMLuaLib

local l_0_0 = this_sigattrlog[4]
local l_0_1 = this_sigattrlog[5]
if not (l_0_0.matched and l_0_1.matched) or isnull(l_0_0.utf8p1) or l_0_0.utf8p1 == "Ip:-" or isnull(l_0_0.utf8p2) or isnull(l_0_1.utf8p2) then
  return mp.CLEAN
end
local l_0_2 = tonumber(string.match(l_0_1.utf8p2, "Pid:(.+);PN") or "0")
if l_0_2 == 0 then
  return mp.CLEAN
end
local l_0_3 = string.match(l_0_0.utf8p1, "Ip:(.+)")
local l_0_4, l_0_5, l_0_6, l_0_7, l_0_8, l_0_9 = string.match(l_0_0.utf8p2, "Wsn:(.-);APkg:NTLM;TSid:(.-);TN:(.-);TDN:(.-);LT:3;SLId:.-;Pid:(.-);PN:(.*)")
bm.trigger_sig("BM_NetworkServiceLogonCombo", safeJsonSerialize({
  SourceIP = l_0_3,
  SourceWorkstation = l_0_4,
  SID = l_0_5,
  User = l_0_6,
  DomainName = l_0_7,
  PID = l_0_8,
  Process = l_0_9,
  ServicesExe = l_0_2
}), l_0_2)
return mp.INFECTED
