-- Threat: !InfrastructureShared
-- Name: OldZbot
-- Type: 17
-- Includes: OldZbot

local l_0_0 = MpDetection.GetCurrentThreat()
if not l_0_0 or type(l_0_0.Name) ~= "string" then
  return
end
if Infrastructure_OldZbotIsOneXThread(l_0_0.Name) then
  local l_0_1 = sysio.RegOpenKey("HKLM\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon")
  local l_0_2
  if l_0_1 then
    l_0_2 = sysio.GetRegValueAsString(l_0_1, "userinit")
  end
  local l_0_3 = 0
  if type(l_0_2) == "string" then
    for l_0_4 in string.gmatch(l_0_2, "[^,]+") do
      if l_0_3 == 0 and not string.find(l_0_4, "userinit.exe", 1, true) then
        return
      elseif 0 < l_0_3 and string.find(l_0_4, "system32", 1, true) then
        Infrastructure_OldZbotScanWithAttribute("SYSCLEAN:Zbot_scan_begin", "winlogonuserinit://HKLM\\SOFTWARE\\MICROSOFT\\WINDOWS NT\\CURRENTVERSION\\WINLOGON\\\\USERINIT:" .. l_0_4)
      end
      l_0_3 = l_0_3 + 1
    end
  end
  local l_0_5 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Run")
  if type(l_0_5) == "table" then
    for l_0_6, l_0_7 in pairs(l_0_5) do
      if type(l_0_7) == "string" then
        local l_0_8 = sysio.RegOpenKey(l_0_7)
        if l_0_8 then
          local l_0_9 = sysio.GetRegValueAsString(l_0_8, "Userinit")
          if type(l_0_9) == "string" and string.find(l_0_9, "App", 1, true) then
            Infrastructure_OldZbotScanWithAttribute("SYSCLEAN:Zbot_scan_begin", "runkey://" .. l_0_7 .. "\\\\Userinit")
            local l_0_10 = Infrastructure_OldZbotNormalizePathValue(l_0_9)
            if l_0_10 then
              local l_0_11 = Infrastructure_OldZbotExpandPaths(l_0_10, true)
              if next(l_0_11) then
                for l_0_12, l_0_13 in pairs(l_0_11) do
                  Infrastructure_OldZbotScanWithAttribute("SYSCLEAN:Zbot_scan_begin", "file://" .. l_0_13)
                end
              else
                Infrastructure_OldZbotScanWithAttribute("SYSCLEAN:Zbot_scan_begin", "file://" .. l_0_10)
              end
            end
          end
        end
      end
    end
  end
  return
end
if Infrastructure_OldZbotIsTwoXThread(l_0_0.Name) then
  local l_0_14 = Infrastructure_OldZbotGetTwoXCandidates()
  for l_0_15, l_0_16 in ipairs(l_0_14) do
    Infrastructure_OldZbotScanWithAttribute("SYSCLEAN:Zbot_2x_scan_begin", "file://" .. l_0_16.path)
  end
end
