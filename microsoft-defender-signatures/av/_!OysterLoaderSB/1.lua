-- Threat: \xac!OysterLoader.SB
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & RPF:AnyFileHasIOAVURL

local l_0_0 = mp.IOAVGetDownloadUrl()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_1 = "^https?:\\/\\/[^\\/]+\\/(?:gov|secure|model|market|store)(?:\\/(?:gov|secure|model|market|store))?\\/[0-9a-fA-F]{42,64}$"
local l_0_2, l_0_3 = MpCommon.StringRegExpSearch(l_0_1, l_0_0)
if l_0_2 then
  local l_0_4 = mp.GetCertificateInfo()
  for l_0_5, l_0_6 in pairs(l_0_4) do
    if l_0_6.Signers == nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
