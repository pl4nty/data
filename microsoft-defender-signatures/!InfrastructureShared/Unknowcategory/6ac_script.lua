-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6ac_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
  if (bm.GetSignatureMatchDuration)() > 30000000 then
    return mp.CLEAN
  end
  local l_0_0 = ((this_sigattrlog[1]).utf8p2):lower()
  if #l_0_0 < 62 then
    return mp.CLEAN
  end
  l_0_0 = (string.gsub)(l_0_0, "\\1$", "")
  local l_0_1 = #l_0_0 / 2
  local l_0_2 = (string.sub)(l_0_0, -l_0_1)
  local l_0_3, l_0_4 = (bm.get_process_relationships)()
  for l_0_8,l_0_9 in ipairs(l_0_4) do
    local l_0_10 = (mp.bitand)(l_0_9.reason_ex, bm.RELATIONSHIP_CREATED)
    if l_0_10 == bm.RELATIONSHIP_CREATED then
      local l_0_11 = (string.lower)(l_0_9.cmd_line)
      if (string.find)(l_0_11, "powershell", 1, true) and ((string.find)(l_0_11, " %-wi?n?d?o?w?s?t?y?l?e?%s+1%s") or (string.find)(l_0_11, " %-wi?n?d?o?w?s?t?y?l?e?%s+hi?d?d?e?n?%s") or (string.find)(l_0_11, "http", 1, true) or (string.find)(l_0_11, "iex ", 1, true) or (string.find)(l_0_11, "iex(", 1, true) or (string.find)(l_0_11, "|iex", 1, true) or (string.find)(l_0_11, "irm ", 1, true) or (string.find)(l_0_11, "iwr ", 1, true) or (string.find)(l_0_11, "curl", 1, true) or (string.find)(l_0_11, "invoke-webrequest", 1, true) or (string.find)(l_0_11, "frombase64string", 1, true) or (string.find)(l_0_11, "sockets.tcpclient", 1, true) or (string.find)(l_0_11, "conhost", 1, true)) then
        local l_0_12 = (string.sub)(l_0_11, -l_0_1)
        if l_0_2 == l_0_12 then
          (bm.trigger_sig)("StartedViaRUNMRU", "StartedViaRUNMRU", l_0_9.ppid)
          return mp.INFECTED
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

