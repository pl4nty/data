-- Threat: !InfrastructureShared
-- Name: Ldpinch
-- Type: 15

function RemoveLdpinchAppDataValue()
  local l_1_0 = sysio.RegOpenKey("HKLM\\SOFTWARE\\WOW6432Node\\Microsoft\\Windows\\CurrentVersion\\Run")
  
  if l_1_0 ~= nil then
    local l_1_1 = sysio.RegEnumValues(l_1_0)
    for l_1_2, l_1_3 in pairs(l_1_1) do
      if sysio.GetRegValueType(l_1_0, l_1_3) == 2 then
        local l_1_4 = sysio.GetRegValueAsString(l_1_0, l_1_3)
        if l_1_4 ~= nil then
          local l_1_5 = sysio.ExpandFilePath(l_1_4, true)
          for l_1_6, l_1_7 in pairs(l_1_5) do
            l_1_7 = string.lower(l_1_7)
            for l_1_8, l_1_9 in ipairs(Remediation.Threat.Resources) do
              if l_1_9.Schema == "file" then
                local l_1_10 = string.lower(l_1_9.Path)
                if l_1_10 == l_1_7 then
                  sysio.DeleteRegValue(l_1_0, l_1_3)
                end
              end
            end
          end
        end
      end
    end
  end
end

function Is64BitOperatingSystem()
  return Info.EngineHost == "HOST_X64"
end

function IsWindows8OrGreater()
  return Info.OSMajorVersion == 6 and Info.OSMinorVersion > 1 or Info.OSMajorVersion > 6
end

if IsWindows8OrGreater() and Is64BitOperatingSystem() then
  RemoveLdpinchAppDataValue()
end
