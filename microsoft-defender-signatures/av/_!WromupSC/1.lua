-- Threat: \xac!Wromup.SC
-- Type: 24
-- MpAttributes: Lua:SingleFileInZip & (BRUTE:VbsFileExtStringInHeader | BRUTE:VbsFileExtStringInFooter) & (RPF:AnyFileHasIOAVURL | Lua:HasMotw)

local l_0_0 = mp.IOAVGetDownloadUrl()
if (l_0_0 == "" or l_0_0 == nil) and mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) then
  local l_0_1 = mp.GetMOTWZone()
  local l_0_3 = l_0_1 == 3 or l_0_1 == 4
  if l_0_3 then
    l_0_0 = mp.GetMOTWHostUrl()
  end
end
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if l_0_0 == "https://web.whatsapp.com/" then
  return mp.INFECTED
end
return mp.CLEAN
