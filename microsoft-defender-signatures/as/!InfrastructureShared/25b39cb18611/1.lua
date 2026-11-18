-- Threat: !InfrastructureShared
-- Name: 25b39cb18611
-- Type: 21

local l_0_0 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
if not string.find(l_0_0, "^c:\\") and not string.find(l_0_0, "^\\\\") then
  return mp.CLEAN
end
local l_0_1 = MpCommon.QueryPersistContext(l_0_0, "ExecutedPENoCert")
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = MpCommon.GetPersistContextNoPath("bm_uacbypass_connmgr")
if l_0_2 then
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    local l_0_5, l_0_6 = string.match(l_0_4, "(.+);ImagePath:(.+)")
    if l_0_6 then
      l_0_6 = MpCommon.PathToWin32Path(l_0_6)
      if sysio.IsFileExists(l_0_6) then
        bm.add_related_file(l_0_6)
        l_0_4 = string.gsub(l_0_4, ",", "_")
        bm.add_related_string("PossibleTrigger", l_0_4, bm.RelatedStringBMReport)
      end
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
