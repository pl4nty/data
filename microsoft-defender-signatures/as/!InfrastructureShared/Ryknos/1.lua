-- Threat: !InfrastructureShared
-- Name: Ryknos
-- Type: 17

local l_0_0 = MpCommon.ExpandEnvironmentVariables("%windir%\\system32")
if l_0_0 then
  local l_0_1 = sysio.FindFiles(l_0_0, "*.exe", 0)
  if l_0_1 then
    for l_0_2, l_0_3 in pairs(l_0_1) do
      MpDetection.ScanResource("file://" .. l_0_3)
    end
  end
end
