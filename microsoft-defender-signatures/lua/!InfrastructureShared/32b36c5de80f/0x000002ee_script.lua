-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b36c5de80f\0x000002ee_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil and (this_sigattrlog[1]).utf8p2 ~= "" then
  local l_0_0 = (bm.get_current_process_startup_info)()
  local l_0_1 = (bm.get_imagepath)()
  local l_0_2 = l_0_0.command_line
  if IsExcludedByCmdlineMacOS(l_0_2) or IsExcludedByImagePathMacOS(l_0_1) then
    return mp.CLEAN
  end
  local l_0_3 = (this_sigattrlog[1]).utf8p2
  if IsKeyValuePairInRollingQueue("MAC_BROWSERDOWNLOAD_PATH", "mac_browserdownload_path", l_0_3) then
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

