-- Threat: !InfrastructureShared
-- Name: Allaple
-- Type: 17

local l_0_0 = sysio.RegOpenKey("HKLM\\SOFTWARE\\CLASSES\\CLSID")
if l_0_0 then
  local l_0_1 = sysio.RegEnumKeys(l_0_0)
  if l_0_1 then
    for l_0_2, l_0_3 in ipairs(l_0_1) do
      MpDetection.ScanResource("clsid://HKLM\\SOFTWARE\\CLASSES\\CLSID\\" .. l_0_3)
    end
  end
end
