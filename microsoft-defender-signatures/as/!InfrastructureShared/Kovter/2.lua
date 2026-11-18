-- Threat: !InfrastructureShared
-- Name: Kovter
-- Type: 15

function RemovePayloadFromRegistry(l_1_0, l_1_1)
  local l_1_2 = sysio.RegOpenKey(l_1_0)
  
  if l_1_2 then
    local l_1_3 = sysio.RegQueryInfoKey(l_1_2)
    local l_1_4 = l_1_3.cValues
    if l_1_4 ~= 6 then
      return
    else
      local l_1_5 = string.lower(sysio.GetRegValueAsString(l_1_2, l_1_1))
      if l_1_5 and string.match(l_1_5, "%+=string%.fromcharcode%(.*eval%(.*") then
        sysio.DeleteRegKey(l_1_2, nil)
      end
    end
  end
end

function RemoveKovterLnk(l_2_0, l_2_1)
  if l_2_0 and sysio.IsFileExists(l_2_0) then
    local l_2_2 = sysio.GetFileSize(l_2_0)
    if 1500 < l_2_2 then
      return
    end
    local l_2_3 = string.lower(sysio.ReadFileRaw(l_2_0, 0, l_2_2))
    local l_2_4 = string.gsub(l_2_3, "%z", "")
    if not l_2_4 then
      return nil
    end
    if l_2_1 then
      do
        local l_2_5 = "\"([^\"]+\\appdata\\roaming\\%w+\\%w+%." .. l_2_1 .. ")\""
        local l_2_6 = string.match(l_2_4, l_2_5)
        if l_2_6 and sysio.IsFileExists(l_2_6) then
          sysio.DeleteFile(l_2_6)
          sysio.DeleteFile(l_2_0)
        end
      end
    else
      sysio.DeleteFile(l_2_0)
      local l_2_7 = "(c:\\[^\"]+\\appdata\\local\\%w+)\\(%w+%.%w+\"?)"
      local l_2_8, l_2_9 = string.match(l_2_4, l_2_7)
      if l_2_8 and sysio.IsFolderExists(l_2_8) then
        local l_2_10 = sysio.FindFiles(l_2_8, "*", 0)
        for l_2_11, l_2_12 in pairs(l_2_10) do
          sysio.DeleteFile(l_2_12)
        end
      end
    end
  end
end

function RemoveKovterASEPS_JS(l_3_0)
  local l_3_1 = sysio.RegOpenKey(l_3_0)
  local l_3_2 = false
  if l_3_1 then
    local l_3_3 = sysio.RegEnumValues(l_3_1)
    for l_3_4, l_3_5 in pairs(l_3_3) do
      local l_3_6 = string.lower(sysio.GetRegValueAsString(l_3_1, l_3_5))
      if not l_3_6 then
        return false
      end
      if string.match(l_3_6, "mshta \"?javascript:.*;\"?$") or string.match(l_3_6, "mshta%.exe\"? \"?javascript:.*;\"?$") then
        sysio.DeleteRegValue(l_3_1, l_3_5)
        l_3_2 = true
        if string.sub(string.lower(l_3_0), 1, string.len("hkcu")) == "hkcu" then
          local l_3_7, l_3_8 = string.match(l_3_6, "regread%(%\"(hkcu\\\\software\\\\%w%w%w+)\\\\(%w%w%w+).*")
          if l_3_7 and l_3_8 then
            l_3_7 = string.gsub(l_3_7, "\\\\", "\\")
            RemovePayloadFromRegistry(l_3_7, l_3_8)
          end
        else
          local l_3_9, l_3_10 = string.match(l_3_6, "regread%(%\"(hklm\\\\software\\\\wow6432node\\\\%w%w%w+)\\\\(%w%w%w+).*")
          if l_3_9 and l_3_10 then
            l_3_9 = string.gsub(l_3_9, "\\\\", "\\")
            RemovePayloadFromRegistry(l_3_9, l_3_10)
          end
        end
      elseif string.match(l_3_6, "\\appdata\\local\\%w+\\%w+%.%w%w%w%w+\"?$") then
        l_3_6 = l_3_6:gsub("\"", "")
        sysio.DeleteRegValue(l_3_1, l_3_5)
        l_3_2 = true
        sysio.DeleteFile(l_3_6)
      elseif string.match(l_3_6, "\\appdata\\local\\%w+\\%w+%.lnk\"?$") or string.match(l_3_6, "\\appdata\\local\\%w+\\%w+%.bat\"?$") then
        l_3_6 = l_3_6:gsub("\"", "")
        sysio.DeleteRegValue(l_3_1, l_3_5)
        l_3_2 = true
        RemoveKovterLnk(l_3_6)
      end
    end
  end
  return l_3_2
end

function RemoveStartupLnk(l_4_0)
  local l_4_1
  local l_4_2 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Shell Folders")
  for l_4_3, l_4_4 in pairs(l_4_2) do
    local l_4_5 = sysio.RegOpenKey(l_4_4)
    if l_4_5 then
      l_4_1 = sysio.GetRegValueAsString(l_4_5, "Startup")
      if l_4_1 and sysio.IsFolderExists(l_4_1) then
        local l_4_6 = sysio.FindFiles(l_4_1, "*.lnk", 0)
        for l_4_7, l_4_8 in pairs(l_4_6) do
          RemoveKovterLnk(l_4_8, l_4_0)
        end
        break
      end
    end
  end
end

function findKovterFileExtension(l_5_0, l_5_1)
  local l_5_2 = sysio.RegOpenKey(l_5_0)
  if l_5_2 then
    local l_5_3 = sysio.RegEnumKeys(l_5_2)
    for l_5_4, l_5_5 in pairs(l_5_3) do
      if string.match(l_5_5, "^%.%w%w%w%w+$") then
        local l_5_6 = sysio.RegOpenKey(l_5_0 .. "\\" .. l_5_5)
        local l_5_7 = string.lower(sysio.GetRegValueAsString(l_5_6, nil))
        if l_5_7 == l_5_1 then
          local l_5_8 = "hkcu\\software\\classes\\" .. l_5_5
          local l_5_9 = sysio.RegExpandUserKey(l_5_8)
          for l_5_10, l_5_11 in pairs(l_5_9) do
            local l_5_12 = sysio.RegOpenKey(l_5_11)
            if l_5_12 then
              sysio.DeleteRegKey(l_5_12, nil)
            end
          end
          return (string.sub(l_5_5, 2, -1))
        end
      end
    end
  end
  return nil
end

function RemoveASEPS_Classes(l_6_0)
  local l_6_1 = sysio.RegOpenKey(l_6_0)
  if l_6_1 then
    local l_6_2 = sysio.RegEnumKeys(l_6_1)
    for l_6_3, l_6_4 in pairs(l_6_2) do
      local l_6_5 = "HKCU\\Software\\Classes\\" .. l_6_4 .. "\\shell\\open\\command"
      local l_6_6 = sysio.RegOpenKey(l_6_5)
      if l_6_6 then
        local l_6_7 = RemoveKovterASEPS_JS(l_6_5)
        if l_6_7 then
          sysio.DeleteRegKey(l_6_1, l_6_4)
          local l_6_8 = findKovterFileExtension(l_6_0, l_6_4)
          if l_6_8 then
            RemoveStartupLnk(l_6_8)
          end
        end
      end
    end
  end
end

function RemoveKovterASEPS(l_7_0)
  local l_7_1 = sysio.RegOpenKey(l_7_0)
  if l_7_1 then
    local l_7_2 = sysio.RegEnumValues(l_7_1)
    for l_7_3, l_7_4 in pairs(l_7_2) do
      if l_7_4 and string.match(l_7_4, "^{%w%w%w%w%w%w%w%w%-%w%w%w%w%-%w%w%w%w%-%w%w%w%w%-%w%w%w%w%w%w%w%w%w%w%w%w}$") then
        local l_7_5 = string.lower(sysio.GetRegValueAsString(l_7_1, l_7_4))
        if l_7_5 and string.match(l_7_5, "\\microsoft\\{%w+%-%w+%-%w+%-%w+%-%w+}\\{%w+%-%w+%-%w+%-%w+%-%w+}%.exe\"$") then
          l_7_5 = string.gsub(l_7_5, "\"", "")
          sysio.DeleteRegValue(l_7_1, l_7_4)
          Remediation.BtrDeleteFile(l_7_5)
        end
      end
    end
  end
end

if string.match(Remediation.Threat.Name, "JS/Kovter") or string.match(Remediation.Threat.Name, "Win32/Kovter") then
  local l_0_0 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Run")
  for l_0_1, l_0_2 in pairs(l_0_0) do
    RemoveKovterASEPS_JS(l_0_2)
  end
  RemoveKovterASEPS_JS("HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run")
  RemoveKovterASEPS_JS("HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer\\Run")
  RemoveKovterASEPS_JS("HKLM\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Run")
  RemoveKovterASEPS_JS("HKLM\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer\\Run")
  local l_0_3 = sysio.RegExpandUserKey("HKCU\\Software\\Classes")
  for l_0_4, l_0_5 in pairs(l_0_3) do
    RemoveASEPS_Classes(l_0_5)
  end
  RemoveKovterASEPS("HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer\\Run")
  RemoveKovterASEPS("HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run")
end
