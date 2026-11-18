-- Threat: !InfrastructureShared
-- Name: Stoufis
-- Type: 15
-- Includes: BMLuaLib, LuaFuncHelper, Path

local l_0_0 = Remediation and Remediation.Threat
if l_0_0 ~= nil and l_0_0.Resources ~= nil and Remediation.Threat.Name ~= nil and Remediation.Threat.Name == "Trojan:Script/Stoufis.A" then
  local l_0_1 = l_0_0.Resources
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    local l_0_4 = l_0_3.Path
    if l_0_3.Schema == "file" and l_0_4 ~= nil and 4 < #l_0_4 then
      l_0_4 = string.lower(normalize_path(l_0_4))
      local l_0_5 = GetRollingQueue("UrlFileInStartupTargetA")
      if not isnull(l_0_5) then
        for l_0_6 in pairs(l_0_5) do
          local l_0_7 = l_0_5[l_0_6].key
          if l_0_7 ~= nil and l_0_7 == l_0_4 then
            local l_0_8 = l_0_5[l_0_6].value
            if l_0_8 ~= nil and 64 < #l_0_8 and StringEndsWith(l_0_8, ".url") and string.find(l_0_8, "\\windows\\start menu\\programs\\startup\\", 1, true) then
              sysio.DeleteFile(l_0_8)
            end
          end
        end
      end
    end
  end
end
