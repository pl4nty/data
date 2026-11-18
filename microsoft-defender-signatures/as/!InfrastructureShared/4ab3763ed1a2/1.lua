-- Threat: !InfrastructureShared
-- Name: 4ab3763ed1a2
-- Type: 21

local l_0_0 = ""
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = MpCommon.PathToWin32Path(string.lower(this_sigattrlog[2].utf8p1))
end
if l_0_0 == nil then
  return mp.CLEAN
end
if string.find(l_0_0, "\\cache\\", 1, true) or string.find(l_0_0, ".xps", 1, true) or string.find(l_0_0, ".config", 1, true) or string.find(l_0_0, ".tmp", 1, true) or string.find(l_0_0, ".db", 1, true) or string.find(l_0_0, "\\shadercache\\", 1, true) or string.find(l_0_0, "\\amd\\", 1, true) or string.find(l_0_0, "\\spool\\", 1, true) or string.find(l_0_0, "\\filecache", 1, true) then
  return mp.CLEAN
end
local l_0_1 = sysio.GetFileSize(l_0_0)
bm.add_related_string("SuspFileWriteV", tostring(l_0_0), bm.RelatedStringBMReport)
bm.add_related_string("SuspFileWriteV_size", tostring(l_0_1), bm.RelatedStringBMReport)
return mp.INFECTED
