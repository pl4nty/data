-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\73b31ecf1479\1_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p1 ~= nil and (this_sigattrlog[3]).utf8p1 ~= "" then
  local l_0_0 = (this_sigattrlog[3]).utf8p1
  if SuspMacPathsToMonitor(l_0_0, true) then
    local l_0_1 = "mac_scp_file_transfer"
    AppendToRollingQueue(l_0_1, "file_transferred_path", l_0_0)
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

