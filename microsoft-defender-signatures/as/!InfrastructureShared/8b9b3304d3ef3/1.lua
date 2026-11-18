-- Threat: !InfrastructureShared
-- Name: 8b9b3304d3ef3
-- Type: 21

local l_0_0
local l_0_1 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
if sysio.IsFileExists(l_0_1) and not mp.IsKnownFriendlyFile(l_0_1, true, false) then
  bm.add_related_string("VaultAccess", l_0_1, bm.RelatedStringBMReport)
  bm.add_related_file(l_0_1)
  return mp.INFECTED
end
local l_0_2, l_0_3 = bm.get_process_relationships()
if l_0_2 ~= nil then
  for l_0_4, l_0_5 in ipairs(l_0_2) do
    if l_0_5.image_path ~= nil then
      l_0_0 = string.lower(MpCommon.PathToWin32Path(l_0_5.image_path))
      if sysio.IsFileExists(l_0_0) and not mp.IsKnownFriendlyFile(l_0_0, true, false) then
        bm.add_related_string("VaultAccess", l_0_0, bm.RelatedStringBMReport)
        bm.add_related_file(l_0_0)
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
