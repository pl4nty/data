-- Threat: !InfrastructureShared
-- Name: e6b3e82009ec
-- Type: 21
-- Includes: LuaFuncHelper

if this_sigattrlog[4].matched then
  local l_0_0 = this_sigattrlog[4].utf8p2
  if l_0_0 ~= nil and l_0_0 ~= "" then
    local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
    if l_0_1 == nil then
      return mp.CLEAN
    end
    local l_0_2 = "mac_scp_file_transfer"
    if GetRollingQueueCount(l_0_2) > 0 and IsKeyInRollingQueue(l_0_2, "file_transferred_path", true) then
      local l_0_3 = GetRollingQueueKeyValues(l_0_2, "file_transferred_path")
      if l_0_3 ~= nil and 0 < #l_0_3 then
        for l_0_4, l_0_5 in ipairs(l_0_3) do
          for l_0_6, l_0_7 in ipairs(l_0_1) do
            if string.find(l_0_7, "/", 1, true) == 1 and string.find(tostring(l_0_5.value), l_0_7, 1, true) then
              return mp.INFECTED
            end
          end
        end
      end
    end
  end
end
return mp.CLEAN
