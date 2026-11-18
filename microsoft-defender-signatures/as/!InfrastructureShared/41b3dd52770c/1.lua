-- Threat: !InfrastructureShared
-- Name: 41b3dd52770c
-- Type: 21

function add_related_file_wrapper(l_1_0)
  if l_1_0 ~= nil then
    local l_1_1 = mp.GetExecutablesFromCommandLine(l_1_0)
    
    for l_1_2, l_1_3 in ipairs(l_1_1) do
      l_1_3 = string.lower(mp.ContextualExpandEnvironmentVariables(l_1_3))
      if string.find(l_1_3, "cmstp.exe$") == nil and sysio.IsFileExists(l_1_3) then
        bm.add_related_file(l_1_3)
      end
    end
  end
end

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if l_0_3.image_path ~= nil then
    local l_0_4 = mp.bitand(l_0_3.reason_ex, 1)
    local l_0_5 = string.lower(MpCommon.PathToWin32Path(l_0_3.image_path))
    if l_0_4 == 1 and (string.find(l_0_5, "vpn", 1, true) or string.find(l_0_5, ":\\users\\", 1, true) or string.find(l_0_5, "\\msiexe.exe", 1, true) or string.find(l_0_5, ":\\program files", 1, true) or string.find(l_0_5, ":\\windows\\immersivecontrolpanel\\systemsettings.exe", 1, true)) then
      return mp.CLEAN
    end
  end
end
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  add_related_file_wrapper(this_sigattrlog[1].utf8p2)
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  add_related_file_wrapper(this_sigattrlog[2].utf8p1)
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  add_related_file_wrapper(this_sigattrlog[2].utf8p2)
end
return mp.INFECTED
