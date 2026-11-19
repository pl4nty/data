-- Threat: !InfrastructureShared
-- Name: Zbot
-- Type: 17

local l_0_0 = "SYSCLEAN:Zbot_scan_resource"
local l_0_1 = MpDetection.GetCurrentThreat()
if not l_0_1 or type(l_0_1.Name) ~= "string" then
  return
end
if string.find(l_0_1.Name, "PWS:Win32/Zbot", 1, true) ~= 1 then
  return
end
if MpCommon.GetGlobalMpAttribute(l_0_0) then
  return
end
local l_0_2 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Run")
if not l_0_2 then
  return
end
MpCommon.SetGlobalMpAttribute(l_0_0)
for l_0_3, l_0_4 in pairs(l_0_2) do
  local l_0_5 = sysio.RegOpenKey(l_0_4)
  if l_0_5 then
    local l_0_6 = sysio.RegEnumValues(l_0_5)
    if l_0_6 then
      for l_0_7, l_0_8 in pairs(l_0_6) do
        local l_0_9 = sysio.GetRegValueAsString(l_0_5, l_0_8)
        if type(l_0_9) == "string" then
          local l_0_10 = string.lower(l_0_9)
          if string.find(l_0_10, "\\temp\\", 1, true) or string.find(l_0_10, "\\app.*ata\\") then
            MpDetection.ScanResource("hiddenfile://" .. l_0_9)
          end
        end
      end
    end
  end
end
MpCommon.DeleteGlobalMpAttribute(l_0_0)
