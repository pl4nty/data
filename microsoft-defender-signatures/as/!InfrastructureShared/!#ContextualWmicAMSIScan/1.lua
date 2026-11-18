-- Threat: !InfrastructureShared
-- Name: !#ContextualWmicAMSIScan
-- Type: 12

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_AMSI then
  local l_0_1, l_0_2 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_APPNAME)
  if l_0_1 and l_0_2 == "WMI" then
    local l_0_3 = mp.get_contextdata(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
    local l_0_4 = sysio.GetFileNameFromProcess(l_0_3)
    local l_0_5 = string.lower(string.sub(l_0_4, -13)):match("\\([^\\]+%.exe)$")
    if l_0_5 == "wmic.exe" then
      mp.set_mpattribute("MpIsWmicWmiAmsiScan")
    end
  end
end
return mp.CLEAN
