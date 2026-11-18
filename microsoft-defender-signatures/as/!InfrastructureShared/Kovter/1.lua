-- Threat: !InfrastructureShared
-- Name: Kovter
-- Type: 17

function TriggerEMSScan(l_1_0)
  local l_1_1 = sysio.GetProcessFromFileName(l_1_0)
  
  for l_1_2, l_1_3 in pairs(l_1_1) do
    local l_1_4 = string.format("pid:%d", l_1_3.pid)
    MpDetection.ScanResource("ems://" .. l_1_4)
  end
end

local l_0_0 = MpCommon.ExpandEnvironmentVariables("%windir%")
if l_0_0 then
  TriggerEMSScan(l_0_0 .. "\\regsvr32.exe")
  TriggerEMSScan(l_0_0 .. "\\explorer.exe")
end
