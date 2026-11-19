-- Threat: !InfrastructureShared
-- Name: Hiloti
-- Type: 17

local l_0_0 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Mozilla\\Firefox\\Extensions")
if l_0_0 then
  local l_0_1 = sysio.RegEnumValues(l_0_0)
  if l_0_1 then
    for l_0_2, l_0_3 in pairs(l_0_1) do
      if string.match(l_0_3, "^{") then
        local l_0_4 = sysio.GetRegValueAsString(l_0_0, l_0_3)
        if l_0_4 ~= nil and string.match(l_0_4, "Local Settings") then
          local l_0_5 = {"*.js", "*.xul"}
          for l_0_6, l_0_7 in ipairs(l_0_5) do
            local l_0_8 = sysio.FindFiles(l_0_4, l_0_7, 100)
            if l_0_8 then
              for l_0_9, l_0_10 in pairs(l_0_8) do
                MpDetection.ScanResource("file://" .. l_0_10)
              end
            end
          end
        end
      end
    end
  end
end
