-- Threat: !InfrastructureShared
-- Name: 73b31ecf1479
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil and this_sigattrlog[3].utf8p1 ~= "" then
  local l_0_0 = this_sigattrlog[3].utf8p1
  if SuspMacPathsToMonitor(l_0_0, true) then
    local l_0_1 = "mac_scp_file_transfer"
    AppendToRollingQueue(l_0_1, "file_transferred_path", l_0_0)
    return mp.INFECTED
  end
end
return mp.CLEAN
