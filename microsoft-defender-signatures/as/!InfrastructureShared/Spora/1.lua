-- Threat: !InfrastructureShared
-- Name: Spora
-- Type: 15

local l_0_0 = Remediation.Threat
local l_0_1 = {
  "HKCR\\lnkfile",
  "HKLM\\software\\classes\\lnkfile"
}
if l_0_0.Active and string.find(l_0_0.Name, "Ransom:Win32/Spora", 1, true) then
  for l_0_2, l_0_3 in pairs(l_0_1) do
    local l_0_4 = sysio.RegOpenKey(l_0_3)
    if l_0_4 ~= nil then
      local l_0_5 = sysio.GetRegValueAsString(l_0_4, "isShortcut")
      if l_0_5 == nil then
        sysio.SetRegValueAsString(l_0_4, "isShortcut", "")
      end
    end
  end
end
