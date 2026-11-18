-- Threat: !InfrastructureShared
-- Name: 69b3f9e1f047
-- Type: 21

if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  local l_0_0 = this_sigattrlog[3].utf8p2
  local l_0_1 = bm.get_current_process_startup_info()
  if l_0_1 ~= nil and bm.get_current_process_startup_info ~= nil then
    local l_0_2 = string.lower(l_0_1.command_line)
    if string.find(l_0_2, "imagename eq ", 1, true) or string.find(l_0_2, " /", 1, true) or string.find(l_0_2, " -", 1, true) or string.find(l_0_2, "=", 1, true) or string.find(l_0_2, ",", 1, true) then
      return mp.CLEAN
    end
  end
  local l_0_3 = string.lower(bm.get_imagepath())
  if l_0_3 and string.find(l_0_3, "\\windows\\syswow64\\msiexec.exe", 1, true) then
    return mp.CLEAN
  end
  local l_0_4 = string.lower(l_0_0)
  if string.find(l_0_4, "\\appdata\\local\\navegador c6 bank", 1, true) or string.find(l_0_4, "\\appdata\\local\\bitwarden", 1, true) or string.find(l_0_4, "\\desktop\\", 1, true) or string.find(l_0_4, "\\steamapps\\common\\", 1, true) or string.find(l_0_4, "\\jre\\bin\\javaw.exe", 1, true) or string.find(l_0_4, "\\gfx_infra\\tool\\cpp\\tambor\\", 1, true) or string.find(l_0_4, "\\bin\\java.exe", 1, true) or string.find(l_0_4, "\\bin\\cpptools.exe", 1, true) or string.find(l_0_4, "\\antigravity", 1, true) or string.find(l_0_4, "\\tcpexecutor", 1, true) or string.find(l_0_4, "\\joplin", 1, true) then
    return mp.CLEAN
  end
  if sysio.IsFileExists(l_0_0) and mp.IsKnownFriendlyFile(l_0_0, true, false) == false then
    bm.add_threat_file(l_0_0)
  end
end
return mp.INFECTED
