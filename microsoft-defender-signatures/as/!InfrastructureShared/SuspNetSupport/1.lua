-- Threat: !InfrastructureShared
-- Name: SuspNetSupport
-- Type: 15

local l_0_0 = Remediation.Threat
if l_0_0.Active and string.match(l_0_0.Name, "Behavior:Win32/SuspNetSupport.C") then
  for l_0_1, l_0_2 in ipairs(Remediation.Threat.Resources) do
    if l_0_2.Schema == "behavior" then
      local l_0_3 = string.lower(string.match(l_0_2.Path, "process: (%a:\\[^,]+%.exe)"))
      if l_0_3 then
        local l_0_4 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Run")
        if l_0_4 then
          for l_0_5, l_0_6 in pairs(l_0_4) do
            if string.find(string.lower(l_0_6), "hkcu@s-1-5-21-", 1, true) then
              local l_0_7 = sysio.RegOpenKey(l_0_6)
              if l_0_7 then
                local l_0_8 = sysio.RegEnumValues(l_0_7)
                for l_0_9, l_0_10 in pairs(l_0_8) do
                  local l_0_11 = string.lower(sysio.GetRegValueAsString(l_0_7, l_0_10))
                  if l_0_11 and l_0_11 == l_0_3 then
                    sysio.DeleteRegValue(l_0_7, l_0_10)
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
