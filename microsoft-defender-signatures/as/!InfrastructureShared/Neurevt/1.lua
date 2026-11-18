-- Threat: !InfrastructureShared
-- Name: Neurevt
-- Type: 15

function DeleteAutoRun(l_1_0)
  if l_1_0 then
    local l_1_1 = sysio.RegEnumValues(l_1_0)
    
    for l_1_2, l_1_3 in pairs(l_1_1) do
      if l_1_3 then
        local l_1_4 = sysio.GetRegValueAsString(l_1_0, l_1_3)
        if l_1_4 then
          local l_1_5, l_1_6 = string.match(l_1_4, "(.+\\)([^\\]+%.exe)\"$")
          if l_1_5 ~= nil and l_1_6 ~= nil then
            l_1_5 = string.lower(l_1_5)
            if l_1_5:find(":\\programdata\\", 1, true) == nil and l_1_5:find(":\\program files\\common files\\", 1, true) == nil then
              return
            end
            local l_1_7 = string.len(l_1_6)
            if l_1_7 == 13 then
              for l_1_8 = 1, l_1_7 - 4 do
                local l_1_9 = string.byte(l_1_6, l_1_8)
                if l_1_9 < 97 or 122 < l_1_9 then
                  return
                end
              end
            end
            local l_1_10 = "HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Image File Execution Options\\" .. l_1_6
            Remediation.BtrDeleteRegKey(l_1_10)
            l_1_10 = "HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\Run\\\\" .. l_1_3
            Remediation.BtrDeleteRegValue(l_1_10)
            sysio.DeleteRegValue(l_1_0, l_1_3)
            if sysio.IsFileExists(l_1_4) then
              Remediation.BtrDeleteFile(l_1_4)
            end
            Remediation.BtrDeleteRegKey("HKLM\\SOFTWARE\\Win7zip")
            Remediation.BtrDeleteRegValue("HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Image File Execution Options\\spybotsd.exe\\\\" .. "Debugger")
            Remediation.BtrDeleteRegValue("HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Image File Execution Options\\hijackthis.exe\\\\" .. "Debugger")
            Remediation.BtrDeleteRegValue("HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Image File Execution Options\\rstrui.exe\\\\" .. "Debugger")
            Remediation.BtrDeleteRegValue("HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Image File Execution Options\\housecalllauncher.exe\\\\" .. "Debugger")
          end
        end
      end
    end
  end
end

if Remediation.Threat.Active and string.match(Remediation.Threat.Name, "Behavior:") then
  local l_0_0 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Run")
  for l_0_1, l_0_2 in pairs(l_0_0) do
    local l_0_3 = sysio.RegOpenKey(l_0_2)
    DeleteAutoRun(l_0_3)
  end
end
