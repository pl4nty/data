-- Threat: !InfrastructureShared
-- Name: 35b394e12bf0
-- Type: 21

local l_0_0 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
if not string.find(l_0_0, "c:\\users\\", 1, true) and not string.find(l_0_0, "c:\\programdata\\", 1, true) and not string.find(l_0_0, "\\appdata\\local\\", 1, true) and not string.find(l_0_0, "\\kmspico\\", 1, true) then
  return mp.CLEAN
end
local l_0_1 = MpCommon.GetPersistContextNoPath("bm_uacbypass_connmgr")
if l_0_1 then
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    local l_0_4, l_0_5 = string.match(l_0_3, "(.+);ImagePath:(.+)")
    if l_0_5 then
      l_0_5 = MpCommon.PathToWin32Path(l_0_5)
      if sysio.IsFileExists(l_0_5) then
        bm.add_related_file(l_0_5)
        l_0_3 = string.gsub(l_0_3, ",", "_")
        bm.add_related_string("PossibleTrigger", l_0_3, bm.RelatedStringBMReport)
      end
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
