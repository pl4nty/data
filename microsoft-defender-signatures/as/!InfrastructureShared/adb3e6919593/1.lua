-- Threat: !InfrastructureShared
-- Name: adb3e6919593
-- Type: 21

if this_sigattrlog[3].matched then
  local l_0_0 = string.lower(this_sigattrlog[3].utf8p2)
  if string.find(l_0_0, ":\\windows", 2, true) or string.find(l_0_0, "%windir%", 1, true) or string.find(l_0_0, "\"%windows%", 1, true) then
    return mp.CLEAN
  end
end
local l_0_1 = MpCommon.PathToWin32Path(bm.get_imagepath())
if mp.IsKnownFriendlyFile(l_0_1, true, false) == false then
  bm.add_related_file(l_0_1)
end
local l_0_2 = bm.get_current_process_startup_info().ppid
if l_0_2 ~= nil then
  local l_0_3 = string.lower(mp.GetProcessCommandLine(l_0_2))
  if l_0_3 ~= nil then
    local l_0_4 = mp.GetExecutablesFromCommandLine(l_0_3)
    for l_0_5, l_0_6 in ipairs(l_0_4) do
      if sysio.IsFileExists(l_0_6) then
        bm.add_related_file(l_0_6)
      end
    end
  end
end
return mp.INFECTED
