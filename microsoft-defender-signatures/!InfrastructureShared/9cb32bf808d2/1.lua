-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\9cb32bf808d2\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1 = l_0_0.command_line
local l_0_2 = (bm.get_imagepath)()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
if (this_sigattrlog[3]).matched and (this_sigattrlog[4]).matched then
  local l_0_3 = (this_sigattrlog[3]).utf8p2
  local l_0_4 = (this_sigattrlog[4]).utf8p1
  if l_0_3 ~= nil and l_0_3 ~= "" and l_0_4 ~= nil and l_0_4 ~= "" and (string.find)(l_0_3, l_0_4, 1, true) then
    local l_0_5 = "mac_scp_file_transfer"
    AppendToRollingQueue(l_0_5, "file_transferred_path", l_0_4, 7200, 100, 0)
    TrackPidAndTechniqueBM("BM", "T1105", "CommandAndControl_IngressToolTransfer_Rsync")
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

