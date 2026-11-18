-- Threat: !InfrastructureShared
-- Name: !#Lua:HtaInsideZipWithIOAVUrl
-- Type: 13
-- MpAttributes: Lua:HTAExt

local l_0_0, l_0_1 = mp.UfsGetMetadataBool("Lua:FileInZip", true)
if l_0_0 ~= 0 or not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = mp.IOAVGetDownloadUrl()
if l_0_2 ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
