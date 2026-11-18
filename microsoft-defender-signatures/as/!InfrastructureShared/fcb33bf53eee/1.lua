-- Threat: !InfrastructureShared
-- Name: fcb33bf53eee
-- Type: 21
-- Includes: BMLuaLib

if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p1 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[6].utf8p1)
  if l_0_0 ~= nil and l_0_0 ~= "" then
    local l_0_1 = l_0_0:match("\\([^\\]+)$")
    if this_sigattrlog[7].matched and this_sigattrlog[7].utf8p2 ~= nil then
      local l_0_2 = string.lower(this_sigattrlog[7].utf8p2)
      if l_0_2:find("ablebitsdownloader.exe", 1, true) or l_0_2:find("gzipcompress.exe", 1, true) or l_0_2:find("cognossessionmonitor.exe", 1, true) or l_0_2:find("webviewhost.exe", 1, true) then
        return mp.CLEAN
      end
      if l_0_2:find(l_0_1, 1, true) then
        local l_0_3 = bm.get_current_process_startup_info()
        if l_0_3 ~= nil and l_0_3.command_line ~= nil and l_0_3.command_line ~= "" then
          bm_AddRelatedFileFromCommandLine(l_0_3.command_line, nil, nil, 1)
        end
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
