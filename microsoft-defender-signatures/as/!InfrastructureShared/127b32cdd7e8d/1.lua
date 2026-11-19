-- Threat: !InfrastructureShared
-- Name: 127b32cdd7e8d
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[2].matched and this_sigattrlog[3].matched and this_sigattrlog[5].matched then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
  local l_0_1 = string.match(string.lower(this_sigattrlog[2].utf8p1), "^(.+)\\\\imagepath")
  if l_0_0 ~= l_0_1 then
    return mp.CLEAN
  end
  local l_0_2 = string.lower(this_sigattrlog[2].utf8p2)
  if l_0_2 == nil or 1 >= string.len(l_0_2) then
    return mp.CLEAN
  elseif string.find(l_0_2, "\\program files", 1, true) or string.find(l_0_2, "\\system32\\", 1, true) or string.find(l_0_2, "\\syswow64\\", 1, true) or string.find(l_0_2, "%windir%\\", 1, true) or string.find(l_0_2, "\\programdata\\", 1, true) or string.find(l_0_2, "\\users\\", 1, true) or string.find(l_0_2, "\\macromed\\flash\\", 1, true) or string.find(l_0_2, "\\svchost.exe -k ", 1, true) or string.find(l_0_2, "\\ccmexec.exe", 1, true) or string.find(l_0_2, "\\ccmsetup.exe", 1, true) or string.find(l_0_2, "\\msiexec.exe", 1, true) or string.find(l_0_2, "\\pnkbstr", 1, true) or string.find(l_0_2, "\\uiusrv.exe", 1, true) or string.find(l_0_2, "service.exe", 1, true) or string.find(l_0_2, "\\framepkg", 1, true) or string.find(l_0_2, "\\veeam", 1, true) or string.find(l_0_2, "\\bginfo", 1, true) or string.find(l_0_2, "\\addmremquery", 1, true) or string.find(l_0_2, "\\ltsvc", 1, true) or string.find(l_0_2, ".sys", 1, true) then
    return mp.CLEAN
  end
  for l_0_3 = 1, mp.SIGATTR_LOG_SZ do
    if sigattr_head[l_0_3].matched and sigattr_head[l_0_3].attribute == 16400 then
      local l_0_4 = string.match(string.lower(sigattr_head[l_0_3].utf8p1), "\\([^\\]+)$")
      if string.find(l_0_2, l_0_4, 1, true) then
        local l_0_5 = mp.GetExecutablesFromCommandLine(l_0_2)
        for l_0_6, l_0_7 in ipairs(l_0_5) do
          l_0_7 = mp.ContextualExpandEnvironmentVariables(l_0_7)
          if sysio.IsFileExists(l_0_7) then
            mp.ReportLowfi(l_0_7, 2253321900)
            bm.add_related_file(l_0_7)
          end
        end
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
