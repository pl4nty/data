-- Threat: !InfrastructureShared
-- Name: Safemode
-- Type: 15

local l_0_0 = Remediation.Threat.Name
if string.find(l_0_0, "Safemode.D", 1, true) then
  local l_0_1 = MpCommon.GetPersistContextNoPath("RegKeyToDelete_safemode")
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    local l_0_4 = string.match(l_0_3, "(.*)\\\\")
    local l_0_5 = sysio.RegOpenKey(l_0_4)
    if l_0_5 ~= nil then
      sysio.DeleteRegKey(l_0_5, nil)
    end
  end
end
