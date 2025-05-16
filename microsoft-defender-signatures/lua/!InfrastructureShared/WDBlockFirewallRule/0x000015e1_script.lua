-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\WDBlockFirewallRule\0x000015e1_luac 

-- params : ...
-- function num : 0
local l_0_0 = Remediation.Threat
if (l_0_0 and (string.find)(l_0_0.Name, "Behavior:Win32/WDBlockFirewallRule.P", 1, true)) or (string.find)(l_0_0.Name, "Behavior:Win32/WDBlockFirewallRule.S", 1, true) then
  (Remediation.SetRebootRequired)()
end

