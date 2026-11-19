-- Threat: !InfrastructureShared
-- Name: 65b38ef92f7c
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  if bm.GetSignatureMatchDuration() > 30000000 then
    return mp.CLEAN
  end
  local l_0_0 = this_sigattrlog[1].utf8p2:lower()
  if #l_0_0 < 32 then
    return mp.CLEAN
  end
  l_0_0 = string.gsub(l_0_0, "\\1$", "")
  local l_0_1 = #l_0_0 / 2
  local l_0_2 = string.sub(l_0_0, -l_0_1)
  local l_0_3, l_0_4 = bm.get_process_relationships()
  for l_0_5, l_0_6 in ipairs(l_0_4) do
    local l_0_7 = mp.bitand(l_0_6.reason_ex, bm.RELATIONSHIP_CREATED)
    if l_0_7 == bm.RELATIONSHIP_CREATED then
      local l_0_8 = string.lower(l_0_6.cmd_line)
      l_0_8 = string.gsub(l_0_8, "[\"'`^()+#&]", "")
      if string.find(l_0_8, "powershell", 1, true) and (string.find(l_0_8, " %-wi?n?d?o?w?s?t?y?l?e?%s+1%s") or string.find(l_0_8, " %-wi?n?d?o?w?s?t?y?l?e?%s+hi?d?d?e?n?%s") or string.find(l_0_8, " [%-/][eE][ncodemaNCODEMA]*%s+") or string.find(l_0_8, "http", 1, true) or string.find(l_0_8, "iex ", 1, true) or string.find(l_0_8, "iex(", 1, true) or string.find(l_0_8, "|iex", 1, true) or string.find(l_0_8, "irm ", 1, true) or string.find(l_0_8, "iwr ", 1, true) or string.find(l_0_8, "curl", 1, true) or string.find(l_0_8, "saps ", 1, true) or string.find(l_0_8, "[char", 1, true) or string.find(l_0_8, "start-process", 1, true) or string.find(l_0_8, "new-object", 1, true) or string.find(l_0_8, "::utf8.getstring", 1, true) or string.find(l_0_8, "::ascii.getstring", 1, true) or string.find(l_0_8, "system.net.http.httpclient", 1, true) or string.find(l_0_8, "getasync", 1, true) or string.find(l_0_8, "getstringasync", 1, true) or string.find(l_0_8, "downloadstring", 1, true) or string.find(l_0_8, "downloadfile", 1, true) or string.find(l_0_8, "usebasicparsing", 1, true) or string.find(l_0_8, "downloadstring", 1, true) or string.find(l_0_8, "invoke-webrequest", 1, true) or string.find(l_0_8, "invoke-restmethod", 1, true) or string.find(l_0_8, "invoke-expression", 1, true) or string.find(l_0_8, "frombase64string", 1, true) or string.find(l_0_8, "sockets.tcpclient", 1, true) or string.find(l_0_8, "[scriptblock]::create", 1, true) or string.find(l_0_8, "scriptblock::create", 1, true) or string.find(l_0_8, "'+'", 1, true) or string.find(l_0_8, "\"+\"", 1, true) or string.find(l_0_8, "-w h", 1, true) or string.find(l_0_8, "\226\128\149w h", 1, true) or string.find(l_0_8, "\226\128\148w h", 1, true) or string.find(l_0_8, "-w 1", 1, true) or string.find(l_0_8, "\226\128\149w 1", 1, true) or string.find(l_0_8, "\226\128\148w 1", 1, true) or string.find(l_0_8, "/w 1", 1, true) or string.find(l_0_8, "/w h", 1, true) or string.find(l_0_8, "\226\128\144", 1, true) or string.find(l_0_8, "\226\128\145", 1, true) or string.find(l_0_8, "\226\128\146", 1, true) or string.find(l_0_8, "\226\128\148", 1, true) or string.find(l_0_8, "\226\128\149", 1, true) or string.find(l_0_8, "\226\129\131", 1, true) or string.find(l_0_8, "\239\185\152", 1, true) or string.find(l_0_8, "\239\185\163", 1, true) or string.find(l_0_8, "\239\188\141", 1, true) or string.find(l_0_8, "\226\184\186", 1, true) or string.find(l_0_8, "\226\184\187", 1, true) or string.find(l_0_8, "conhost", 1, true)) then
        local l_0_9 = string.sub(l_0_8, -l_0_1)
        if l_0_2 == l_0_9 then
          bm.trigger_sig("StartedViaRUNMRU", "StartedViaRUNMRU", l_0_6.ppid)
          return mp.INFECTED
        end
      end
    end
  end
end
return mp.CLEAN
