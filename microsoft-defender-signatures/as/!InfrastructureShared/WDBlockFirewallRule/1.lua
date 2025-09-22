-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\WDBlockFirewallRule\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (MpDetection.GetCurrentThreat)()
if l_0_0 and (string.find)(l_0_0.Name, "Behavior:Win32/WDBlockFirewallRule", 1, true) then
  Infrastructure_ScanWDFirewallBlockRules()
end

