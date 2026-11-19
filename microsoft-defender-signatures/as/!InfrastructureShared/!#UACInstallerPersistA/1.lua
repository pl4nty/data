-- Threat: !InfrastructureShared
-- Name: !#UACInstallerPersist.A
-- Type: 19

local l_0_0 = mp.GetUACMetadata()
if l_0_0 ~= nil and l_0_0.Type == mp.AMSI_UAC_REQUEST_TYPE_EXE and l_0_0.TrustState ~= mp.AMSI_UAC_TRUST_STATE_TRUSTED then
  local l_0_1 = string.lower(l_0_0.Info.ApplicationName)
  if string.find(l_0_1, "\\downloads", 1, true) then
    mp.ReportInternalDetection(l_0_0.Info.ApplicationName, 3201970721, mp.TYPE_PERSIST)
  end
end
return mp.FALSE
