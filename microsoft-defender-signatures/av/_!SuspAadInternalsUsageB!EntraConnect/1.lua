-- Threat: \x84!SuspAadInternalsUsage.B!EntraConnect
-- Type: 13
-- Includes: BMLuaLib
-- MpAttributes: MpIsPowerShellAMSIScan

if IsADConnectRole() then
  local l_0_0, l_0_1 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
  if l_0_0 and l_0_1 ~= nil then
    l_0_1 = string.lower(l_0_1)
    if string.find(l_0_1, "\\aadsyncsettings_job.ps1", 1, true) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
