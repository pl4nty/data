-- Threat: !InfrastructureShared
-- Name: !#Lua:HtaInsideRarDownloads
-- Type: 13
-- MpAttributes: MpOnOpenOrCloseRtpScan & Lua:HTAExt

local l_0_0, l_0_1 = mp.UfsGetMetadataBool("Lua:FileInRar", true)
if l_0_0 ~= 0 or not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
if string.find(l_0_2, "\\downloads", 1, true) then
  if string.sub(l_0_2, -10) == "\\downloads" then
    mp.set_mpattribute("Lua:HtaInsideRarDownloadsBasePath")
  elseif string.find(l_0_2, "\\downloads\\", 1, true) then
    mp.set_mpattribute("Lua:HtaInsideRarDownloadsWithSubPath")
  end
  return mp.INFECTED
end
return mp.CLEAN
