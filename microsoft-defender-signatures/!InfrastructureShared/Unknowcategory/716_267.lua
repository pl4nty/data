-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\716_267.luac 

-- params : ...
-- function num : 0
if (Remediation.Threat).Active and (string.find)((Remediation.Threat).Name, "Behavior:Win32/WFP_BFE.B", 1, true) then
  (Remediation.SetRebootRequired)()
end

