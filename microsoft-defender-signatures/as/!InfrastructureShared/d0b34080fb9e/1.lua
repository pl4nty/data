-- Threat: !InfrastructureShared
-- Name: d0b34080fb9e
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0, l_0_1 = bm.get_process_relationships()
  for l_0_2, l_0_3 in ipairs(l_0_0) do
    if l_0_3.image_path ~= nil then
      local l_0_4 = mp.bitand(l_0_3.reason_ex, 1)
      local l_0_5 = string.lower(l_0_3.image_path)
      if l_0_4 == 1 and (string.find(l_0_5, "\\mshta.exe", 1, true) or string.find(l_0_5, "\\bitsadmin.exe", 1, true) or string.find(l_0_5, "\\msbuild.exe", 1, true) or string.find(l_0_5, "\\ieexec.exe", 1, true) or string.find(l_0_5, "\\wmic.exe", 1, true) or string.find(l_0_5, "\\wscript.exe", 1, true) or string.find(l_0_5, "\\cscript.exe", 1, true) or string.find(l_0_5, "\\splunkd.exe", 1, true) or string.find(l_0_5, "\\runscripthelper.exe", 1, true) or not mp.IsKnownFriendlyFile(MpCommon.PathToWin32Path(l_0_3.image_path), true, false)) and not string.find(l_0_5, "\\explorer.exe", 1, true) then
        return mp.INFECTED
      end
    end
  end
  return mp.CLEAN
end
return mp.CLEAN
