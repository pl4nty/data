-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\e6b36d4251fc\1_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[4]).matched then
  local l_0_0 = (this_sigattrlog[4]).utf8p2
  if l_0_0 ~= nil and l_0_0 ~= "" then
    local l_0_1 = (mp.GetExecutablesFromCommandLine)(l_0_0)
    if l_0_1 == nil then
      return mp.CLEAN
    end
    local l_0_2 = "mac_scp_file_transfer"
    if GetRollingQueueCount(l_0_2) > 0 and IsKeyInRollingQueue(l_0_2, "file_transferred_path", true) then
      local l_0_3 = GetRollingQueueKeyValues(l_0_2, "file_transferred_path")
      if l_0_3 ~= nil and #l_0_3 > 0 then
        for l_0_7,l_0_8 in ipairs(l_0_3) do
          for l_0_12,l_0_13 in ipairs(l_0_1) do
            if (string.find)(l_0_13, "/", 1, true) == 1 and (string.find)(tostring(l_0_8.value), l_0_13, 1, true) then
              return mp.INFECTED
            end
          end
        end
      end
    end
  end
end
do
  l_0_0 = mp
  l_0_0 = l_0_0.CLEAN
  return l_0_0
end

