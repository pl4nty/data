-- Threat: !InfrastructureShared
-- Name: 84b32bed16f0
-- Type: 21
-- Includes: LuaFuncHelper

if this_sigattrlog[2].matched and this_sigattrlog[3].matched then
  local l_0_0 = this_sigattrlog[2].utf8p2
  local l_0_1 = this_sigattrlog[3].utf8p1
  if l_0_0 ~= nil and l_0_0 ~= "" and l_0_1 ~= nil and l_0_1 ~= "" then
    local l_0_2 = string.match(l_0_1, "(/.+)/.+")
    if l_0_2 == nil or l_0_2 == "" then
      return mp.CLEAN
    end
    if string.find(l_0_0, l_0_2, 1, true) or (string.find(l_0_0, " /tmp", 1, true) or string.find(l_0_0, " /var", 1, true) or string.find(l_0_0, " /etc", 1, true)) and string.find("/private/", l_0_2, 1, true) == 1 and string.find(l_0_0, string.sub(l_0_2, 9), 1, true) then
      local l_0_3 = "mac_scp_file_transfer"
      AppendToRollingQueue(l_0_3, "zip_transferred_path", l_0_1, 7200, 100, 0)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
