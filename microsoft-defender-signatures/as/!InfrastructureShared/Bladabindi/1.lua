-- Threat: !InfrastructureShared
-- Name: Bladabindi
-- Type: 14

function removeRunningmalicious(l_1_0, l_1_1)
  local l_1_2 = sysio.GetRegValueAsString(l_1_0, l_1_1)
  
  local l_1_3 = string.gsub(l_1_2, "\" ..", "\"")
  l_1_3 = string.gsub(l_1_3, "\"", "")
  if sysio.IsFileExists(l_1_3) then
    Remediation.BtrDeleteFile(l_1_3)
  end
end

function removeStartupmalicious(l_2_0)
  local l_2_1
  local l_2_2 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Shell Folders")
  for l_2_3, l_2_4 in pairs(l_2_2) do
    if l_2_4 ~= nil then
      local l_2_5 = sysio.RegOpenKey(l_2_4)
      if l_2_5 ~= nil then
        l_2_1 = sysio.GetRegValueAsString(l_2_5, "Startup")
        if sysio.IsFolderExists(l_2_1) then
          local l_2_6 = l_2_1 .. "\\" .. l_2_0 .. ".exe"
          if sysio.IsFileExists(l_2_6) then
            Remediation.BtrDeleteFile(l_2_6)
          end
        end
      end
    end
  end
end

function enumhkcuregrun(l_3_0)
  if l_3_0 then
    local l_3_1 = sysio.RegEnumValues(l_3_0)
    for l_3_2, l_3_3 in pairs(l_3_1) do
      if l_3_3 ~= nil and string.match(l_3_3, "^%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x$") then
        local l_3_4 = sysio.GetRegValueAsString(l_3_0, l_3_3)
        if l_3_4 ~= nil and string.match(l_3_4, ".exe\" ..") then
          removeRunningmalicious(l_3_0, l_3_3)
          removeStartupmalicious(l_3_3)
          Remediation.BtrDeleteRegValue("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Run\\\\" .. l_3_3)
        end
      end
    end
  end
end

function enumhklmregrun(l_4_0)
  if l_4_0 then
    local l_4_1 = sysio.RegEnumValues(l_4_0)
    for l_4_2, l_4_3 in pairs(l_4_1) do
      if l_4_3 ~= nil and string.match(l_4_3, "^%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x$") then
        local l_4_4 = sysio.GetRegValueAsString(l_4_0, l_4_3)
        if l_4_4 ~= nil and string.match(l_4_4, ".exe\" ..") then
          removeRunningmalicious(l_4_0, l_4_3)
          removeStartupmalicious(l_4_3)
          Remediation.BtrDeleteRegValue("HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\Run\\\\" .. l_4_3)
        end
      end
    end
  end
end

function enumhkcudi(l_5_0)
  if l_5_0 then
    local l_5_1 = sysio.RegEnumValues(l_5_0)
    for l_5_2, l_5_3 in pairs(l_5_1) do
      if l_5_3 ~= nil and string.match(l_5_3, "^di$") then
        local l_5_4 = sysio.GetRegValueAsString(l_5_0, l_5_3)
        if l_5_4 ~= nil and string.match(l_5_4, "!") then
          Remediation.BtrDeleteRegValue("HKCU\\\\" .. l_5_3)
        end
      end
    end
  end
end

function enumhkcusoft(l_6_0)
  for l_6_1, l_6_2 in pairs(l_6_0) do
    if l_6_2 then
      local l_6_3 = sysio.RegOpenKey(l_6_2)
      if l_6_3 then
        local l_6_4 = sysio.RegEnumKeys(l_6_3)
        for l_6_5, l_6_6 in pairs(l_6_4) do
          if l_6_6 ~= nil and string.match(l_6_6, "^%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x$") then
            local l_6_7 = "HKCU\\Software\\" .. l_6_6
            local l_6_8 = sysio.RegOpenKey(l_6_7)
            if l_6_8 then
              local l_6_9 = sysio.RegEnumValues(l_6_8)
              for l_6_10, l_6_11 in pairs(l_6_9) do
                if l_6_11 ~= nil and (string.match(l_6_11, "kl") or string.match(l_6_11, "US")) then
                  Remediation.BtrDeleteRegKey(l_6_7)
                end
              end
            end
          end
        end
      end
    end
  end
end

if Remediation.Threat.Active and string.match(Remediation.Threat.Name, "Bladabindi") then
  local l_0_0 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Run")
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2 ~= nil then
      local l_0_3 = sysio.RegOpenKey(l_0_2)
      if l_0_3 ~= nil then
        enumhkcuregrun(l_0_3)
      end
    end
  end
  local l_0_4 = sysio.RegExpandUserKey("HKCU")
  for l_0_5, l_0_6 in pairs(l_0_4) do
    if l_0_6 then
      local l_0_7 = sysio.RegOpenKey(l_0_6)
      enumhkcudi(l_0_7)
    end
  end
  local l_0_8 = sysio.RegExpandUserKey("HKCU\\Software")
  enumhkcusoft(l_0_8)
  local l_0_9 = sysio.RegOpenKey("HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\Run")
  enumhklmregrun(l_0_9)
end
