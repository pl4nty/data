-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\eeb3d4220916\0x00000944_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[2]).matched and (this_sigattrlog[3]).matched then
  local l_0_0 = (this_sigattrlog[2]).utf8p2
  local l_0_1 = (this_sigattrlog[3]).utf8p1
  local l_0_2 = nil
  if (this_sigattrlog[4]).matched then
    l_0_2 = (string.lower)((this_sigattrlog[4]).utf8p2)
  else
    if (this_sigattrlog[5]).matched then
      l_0_2 = (string.lower)((this_sigattrlog[5]).utf8p2)
    else
      if (this_sigattrlog[6]).matched then
        l_0_2 = (string.lower)((this_sigattrlog[6]).utf8p2)
      end
    end
  end
  if l_0_0 ~= nil and l_0_0 ~= "" and l_0_1 ~= nil and l_0_1 ~= "" and l_0_2 ~= nil and l_0_2 ~= "" and ((string.lower)(l_0_1) == l_0_2 or (string.find)(l_0_2, (string.lower)(l_0_1))) then
    local l_0_3 = (string.match)(l_0_1, "(/.+)/.+")
    if l_0_3 == nil or l_0_3 == "" then
      return mp.CLEAN
    end
    if ((string.find)(l_0_0, l_0_3, 1, true) or (not (string.find)(l_0_0, " /tmp", 1, true) and not (string.find)(l_0_0, " /var", 1, true) and not (string.find)(l_0_0, " /etc", 1, true)) or (string.find)(l_0_0, (string.sub)(l_0_3, 9), 1, true)) then
      local l_0_4 = "mac_scp_file_transfer"
      AppendToRollingQueue(l_0_4, "file_transferred_path", l_0_1, 7200, 100, 0)
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end

