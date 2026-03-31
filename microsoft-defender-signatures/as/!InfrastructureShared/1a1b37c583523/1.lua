-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1a1b37c583523\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = this_sigattrlog[4]
local l_0_1 = this_sigattrlog[5]
if not l_0_0.matched or not l_0_1.matched or isnull(l_0_0.utf8p1) or l_0_0.utf8p1 == "Ip:-" or isnull(l_0_0.utf8p2) or isnull(l_0_1.utf8p2) then
  return mp.CLEAN
end
local l_0_2 = tonumber((string.match)(l_0_1.utf8p2, "Pid:(.+);PN") or "0")
if l_0_2 == 0 then
  return mp.CLEAN
end
local l_0_3 = (string.match)(l_0_0.utf8p1, "Ip:(.+)")
local l_0_4, l_0_5, l_0_6, l_0_7, l_0_8, l_0_9 = (string.match)(l_0_0.utf8p2, "Wsn:(.-);APkg:NTLM;TSid:(.-);TN:(.-);TDN:(.-);LT:3;SLId:.-;Pid:(.-);PN:(.*)")
local l_0_10 = bm.trigger_sig
local l_0_11 = "BM_NetworkServiceLogonCombo"
local l_0_12 = safeJsonSerialize
local l_0_13 = {}
l_0_13.SourceIP = l_0_3
l_0_13.SourceWorkstation = l_0_4
l_0_13.SID = l_0_5
l_0_13.User = l_0_6
l_0_13.DomainName = l_0_7
l_0_13.PID = l_0_8
l_0_13.Process = l_0_9
l_0_13.ServicesExe = l_0_2
l_0_12 = l_0_12(l_0_13)
l_0_13 = l_0_2
l_0_10(l_0_11, l_0_12, l_0_13)
l_0_10 = mp
l_0_10 = l_0_10.INFECTED
return l_0_10

