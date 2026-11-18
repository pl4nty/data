-- Threat: \xadAObfuse.SS1
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & RPF:AnyFileHasIOAVURL

local l_0_0 = mp.IOAVGetDownloadUrl()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if l_0_0 ~= nil then
  l_0_0 = string.lower(l_0_0)
  if string.find(l_0_0, ".sbs/lander/", 1, true) and string.find(l_0_0, "download.php", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
