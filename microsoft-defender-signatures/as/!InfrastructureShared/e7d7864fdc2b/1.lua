-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\e7d7864fdc2b\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.hstr_full_log)()
if not InitiatingProcessGate() then
  return mp.CLEAN
end
if not BrowserExecutableFromScannedCmdlineGate() then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC51: Unhandled construct in 'MakeBoolean' P3

if (not (l_0_0.br_msedge).matched and not (l_0_0.br_webview2).matched and not (l_0_0.br_chrome).matched) or not (l_0_0.q_qmark).matched and not (l_0_0.q_amp).matched and not (l_0_0.qenc_qmark).matched and not (l_0_0.qenc_amp).matched then
  return mp.CLEAN
end
AddPotentialMaliciousUrlToResearchData()
return mp.INFECTED

