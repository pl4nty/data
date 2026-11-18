-- Threat: !InfrastructureShared
-- Name: VBSAutorun
-- Type: 15

local l_0_0 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion")
for l_0_1, l_0_2 in pairs(l_0_0) do
  local l_0_3 = l_0_2 .. "\\Run"
  local l_0_4 = sysio.RegOpenKey(l_0_3)
  if l_0_4 then
    local l_0_5 = sysio.RegEnumValues(l_0_4)
    for l_0_6, l_0_7 in pairs(l_0_5) do
      local l_0_8 = sysio.GetRegValueAsString(l_0_4, l_0_7)
      if l_0_8 ~= nil and (string.match(string.lower(l_0_8), "^wscript%.exe.+temp.+%.vb[es]\"$") or string.match(string.lower(l_0_8), "^wscript%.exe.+data.+%.vb[es]\"$")) then
        local l_0_9, l_0_10, l_0_11, l_0_12 = string.find(l_0_8, "\"([cC]%:\\.*\\(.+%.[vV][bB][eEsS]))\"")
        if sysio.IsFileExists(l_0_11) then
          Remediation.BtrDeleteFile(l_0_11)
        end
        local l_0_13 = 0
        local l_0_14 = l_0_2 .. "\\Explorer\\Shell Folders"
        local l_0_15 = sysio.RegOpenKey(l_0_14)
        if l_0_15 then
          local l_0_16 = sysio.GetRegValueAsString(l_0_15, "Startup")
          if sysio.IsFolderExists(l_0_16) then
            local l_0_17 = l_0_16 .. "\\" .. l_0_12
            if sysio.IsFileExists(l_0_17) then
              l_0_13 = 1
              Remediation.BtrDeleteFile(l_0_17)
            end
          end
        end
        if l_0_13 == 1 then
          sysio.DeleteRegValue(l_0_4, l_0_7)
          local l_0_18 = "HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\Run\\\\" .. l_0_7
          Remediation.BtrDeleteRegValue(l_0_18)
        end
      end
    end
  end
end
