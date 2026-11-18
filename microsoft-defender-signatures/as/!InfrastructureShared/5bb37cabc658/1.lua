-- Threat: !InfrastructureShared
-- Name: 5bb37cabc658
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
if l_0_0 ~= nil then
  for l_0_2, l_0_3 in ipairs(l_0_0) do
    if l_0_3.image_path ~= nil then
      local l_0_4 = string.lower(MpCommon.PathToWin32Path(l_0_3.image_path))
      if sysio.IsFileExists(l_0_4) and not mp.IsKnownFriendlyFile(l_0_4, true, false) then
        bm.add_related_file(l_0_4)
      end
    end
  end
end
return mp.CLEAN
