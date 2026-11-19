-- Threat: !InfrastructureShared
-- Name: Bondat
-- Type: 14

local l_0_0 = Remediation.Threat
if l_0_0.Name:find("^Worm:JS/Bondat%.?%L?$") or l_0_0.Name:find("^Worm:JS/Bondat!plock$") then
  local l_0_1 = "\\appdata\\roaming"
  for l_0_2, l_0_3 in pairs(l_0_0.Resources) do
    if l_0_3.Schema == "file" then
      local l_0_4, l_0_5, l_0_6 = l_0_3.Path:lower():match("(.+)\\(%w+)\\(%w+%.js)")
      if l_0_4 ~= nil and l_0_4:sub(-1 * #l_0_1) == l_0_1 then
        local l_0_7 = l_0_4 .. "\\" .. l_0_5
        local l_0_8 = sysio.FindFiles(l_0_7, "*.exe", 0)
        local l_0_9 = MpCommon.ExpandEnvironmentVariables("%windir%")
        local l_0_10 = sysio.GetFileSize(l_0_9 .. "\\system32\\wscript.exe")
        local l_0_11 = sysio.ReadFile(l_0_9 .. "\\system32\\wscript.exe", 1, 1024)
        local l_0_12 = crypto.MD5Buffer(l_0_11, 0, 1024)
        for l_0_13, l_0_14 in pairs(l_0_8) do
          if sysio.GetFileSize(l_0_14) == l_0_10 then
            local l_0_15 = sysio.ReadFile(l_0_14, 1, 1024)
            local l_0_16 = crypto.MD5Buffer(l_0_15, 0, 1024)
            if l_0_16 == l_0_12 then
              local l_0_17 = sysio.GetProcessFromFileName(l_0_14)
              for l_0_18, l_0_19 in pairs(l_0_17) do
                local l_0_20 = string.format("pid:%d,ProcessStart:%u", l_0_19.pid, l_0_19.starttime)
                sysio.TerminateProcess(l_0_20)
              end
            end
          end
        end
      end
    end
  end
end
if l_0_0.Name == "Worm:JS/Bondat!lnk" then
  for l_0_21, l_0_22 in pairs(l_0_0.Resources) do
    if l_0_22.Schema == "file" then
      local l_0_23 = l_0_22.Path:match("([^\\]+)%.lnk%->%[CMDEmbedded%]$")
      if l_0_23 ~= nil then
        local l_0_24 = l_0_22.Path:match("^\\\\%?\\(%w:\\)")
        if l_0_24 ~= nil then
          local l_0_25 = l_0_24 .. ".Trashes\\" .. l_0_23
          local l_0_26 = l_0_24 .. "\\" .. l_0_23
          if (sysio.IsFileExists(l_0_25) or sysio.IsFolderExists(l_0_25)) and (not sysio.IsFileExists(l_0_26) or not sysio.IsFolderExists(l_0_26)) then
            sysio.MoveFile(l_0_25, l_0_26)
            sysio.SetFileAttributes(l_0_26, 32)
          end
        end
      end
    end
  end
end
