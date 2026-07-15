-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\OldZbot\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = Remediation.Threat
if not l_0_0 or type(l_0_0.Name) ~= "string" then
  return 
end
local l_0_1 = (sysio.RegOpenKey)("HKLM\\SOFTWARE\\Microsoft\\RemovalTools")
if not l_0_1 then
  return 
end
if Infrastructure_OldZbotIsOneXThread(l_0_0.Name) then
  (sysio.DeleteRegValue)(l_0_1, "mp_loop-001")
else
  if Infrastructure_OldZbotIsTwoXThread(l_0_0.Name) then
    local l_0_2 = (sysio.GetRegValueAsDword)(l_0_1, "mpts")
    if l_0_2 == nil then
      (sysio.SetRegValueAsDword)(l_0_1, "mpts", 1)
    end
  end
end

