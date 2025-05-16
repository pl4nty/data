-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\73b3e1ade41a\0x00000309_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p1 ~= nil and (this_sigattrlog[3]).utf8p1 ~= "" then
  local l_0_0 = (this_sigattrlog[3]).utf8p1
  if not SuspMacPathsToMonitor(l_0_0, true) then
    return mp.CLEAN
  end
  local l_0_1 = "mac_scp_file_transfer"
  local l_0_2 = (bm.get_current_process_startup_info)()
  local l_0_3 = l_0_2.command_line
  if GetRollingQueueCount(l_0_1) > 0 and l_0_3 ~= nil and l_0_3 ~= "" then
    if not IsKeyInRollingQueue(l_0_1, "zip_transferred_path", true) then
      return mp.CLEAN
    end
    local l_0_4 = GetRollingQueueKeyValues(l_0_1, "zip_transferred_path")
    if l_0_4 == nil or #l_0_4 <= 0 then
      return mp.CLEAN
    end
    for l_0_8,l_0_9 in ipairs(l_0_4) do
      local l_0_10 = (l_0_9.value):match("[^/]*$")
      if (string.find)(l_0_3, l_0_10, 1, true) then
        return mp.INFECTED
      end
    end
  end
end
do
  l_0_0 = mp
  l_0_0 = l_0_0.CLEAN
  return l_0_0
end

