-- Threat: !InfrastructureShared
-- Name: Proslikefan
-- Type: 15

if string.match(Remediation.Threat.Name, "Worm:JS/Proslikefan") then
  local l_0_0 = {
    "NoControlPanel",
    "NofolderOptions",
    "NoWindowsUpdate"
  }
  local l_0_1 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer")
  if l_0_1 then
    for l_0_2, l_0_3 in pairs(l_0_1) do
      local l_0_4 = sysio.RegOpenKey(l_0_3)
      if l_0_4 then
        for l_0_5, l_0_6 in ipairs(l_0_0) do
          if sysio.GetRegValueAsString(l_0_4, l_0_6) == "1" then
            sysio.DeleteRegValue(l_0_4, l_0_6)
          end
        end
      end
    end
  end
  local l_0_7 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced")
  if l_0_7 then
    for l_0_8, l_0_9 in pairs(l_0_7) do
      local l_0_10 = sysio.RegOpenKey(l_0_9)
      if l_0_10 and sysio.GetRegValueAsString(l_0_10, "HideFileExt") == "1" then
        sysio.DeleteRegValue(l_0_10, "HideFileExt")
      end
    end
  end
  local l_0_11 = sysio.RegOpenKey("HKLM\\Software\\Microsoft\\Security Center")
  if l_0_11 then
    local l_0_12 = {
      "AntiVirusDisableNotify",
      "AntiVirusOverride",
      "FirewallDisableNotify",
      "FirewallOverride",
      "UpdatesDisableNotify"
    }
    for l_0_13, l_0_14 in ipairs(l_0_12) do
      if sysio.GetRegValueAsString(l_0_11, l_0_14) == "1" then
        sysio.DeleteRegValue(l_0_11, l_0_14)
      end
    end
  end
  local l_0_15 = sysio.RegOpenKey("HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced")
  if l_0_15 and sysio.GetRegValueAsString(l_0_15, "Hidden") == "1" then
    sysio.DeleteRegValue(l_0_15, "Hidden")
  end
  local l_0_16 = sysio.RegOpenKey("HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies")
  if l_0_16 then
    local l_0_17 = {
      "DisableCMD",
      "DisableRegistryTools",
      "DisableTaskMgr",
      "NoDispCPL"
    }
    for l_0_18, l_0_19 in ipairs(l_0_17) do
      if sysio.GetRegValueAsString(l_0_16, l_0_19) == "1" then
        sysio.DeleteRegValue(l_0_16, l_0_19)
      end
    end
  end
  local l_0_20 = sysio.RegOpenKey("HKLM\\Software\\Microsoft\\Windows NT\\CurrentVersion")
  if l_0_20 and sysio.GetRegValueAsString(l_0_20, "SystemRestoreDisableSR") == "1" then
    sysio.SetRegValueAsDword(l_0_20, "SystemRestoreDisableSR", 0)
  end
  local l_0_21 = sysio.RegOpenKey("HKLM\\Software\\Policies\\Microsoft\\MRT")
  if l_0_21 and sysio.GetRegValueAsString(l_0_21, "DontReportInfectionInformation") == "1" then
    sysio.DeleteRegValue(l_0_21, "DontReportInfectionInformation")
  end
  local l_0_22 = sysio.RegOpenKey("HKLM\\Software\\Policies\\Microsoft\\Windows NT\\SystemRestore")
  if l_0_22 and sysio.GetRegValueAsString(l_0_22, "DisableConfig") == "1" then
    sysio.DeleteRegValue(l_0_22, "DisableConfig")
  end
  local l_0_23 = sysio.RegOpenKey("HKLM\\System\\CurrentControlSet\\Services\\wscsvc")
  if l_0_23 and sysio.GetRegValueAsString(l_0_23, "Start") == "4" then
    sysio.SetRegValueAsDword(l_0_23, "Start", 2)
  end
  local l_0_24 = sysio.RegOpenKey("HKLM\\System\\CurrentControlSet\\Services\\SharedAccess\\Parameters\\FirewallPolicy\\StandardProfile")
  if l_0_24 and sysio.GetRegValueAsString(l_0_24, "EnableFirewall") == "0" then
    sysio.SetRegValueAsDword(l_0_24, "EnableFirewall", 1)
  end
  for l_0_25, l_0_26 in ipairs(Remediation.Threat.Resources) do
    if l_0_26.Schema == "file" then
      local l_0_27 = string.match(l_0_26.Path, "(%a:)\\")
      if l_0_27 then
        local l_0_28 = l_0_27 .. "\\228c"
        for l_0_29, l_0_30 in ipairs({
          "2a2a",
          "2e2",
          "34",
          "340",
          "3f9"
        }) do
          local l_0_31 = sysio.FindFiles(l_0_28, l_0_30, 0)
          if l_0_31 then
            for l_0_32, l_0_33 in pairs(l_0_31) do
              sysio.DeleteFile(l_0_33)
            end
          end
        end
      end
    end
  end
  local l_0_34 = {
    "%ALLUSERSPROFILE%\\Start Menu\\Programs\\Startup",
    "%USERPROFILE%\\Start Menu\\Programs\\Startup"
  }
  for l_0_35, l_0_36 in ipairs(l_0_34) do
    local l_0_37 = MpCommon.ExpandEnvironmentVariables(l_0_36)
    if l_0_37 then
      local l_0_38 = sysio.FindFiles(l_0_37, "*.js", 0)
      if l_0_38 then
        for l_0_39, l_0_40 in pairs(l_0_38) do
          sysio.DeleteFile(l_0_40)
        end
      end
    end
  end
  local l_0_41 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Run")
  if l_0_41 then
    for l_0_42, l_0_43 in pairs(l_0_41) do
      local l_0_44 = sysio.RegOpenKey(l_0_43)
      if l_0_44 then
        local l_0_45 = sysio.RegEnumValues(l_0_44)
        if l_0_45 then
          for l_0_46, l_0_47 in pairs(l_0_45) do
            local l_0_48 = sysio.GetRegValueAsString(l_0_44, l_0_47)
            if l_0_48 ~= nil then
              local l_0_49 = string.match(l_0_48, "%.([^%.\\/]+)$")
              if l_0_49 == "js" then
                sysio.DeleteRegValue(l_0_44, l_0_47)
                sysio.DeleteFile(l_0_48)
              end
            end
          end
        end
      end
    end
  end
  Remediation.SetRemovalPolicy(crypto.bitor(Remediation.Threat.RemovalPolicy, 4))
end
