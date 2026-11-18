-- Threat: !InfrastructureShared
-- Name: 4ab3321ae3a0
-- Type: 21

local l_0_0 = ""
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = MpCommon.PathToWin32Path(string.lower(this_sigattrlog[2].utf8p1))
end
if l_0_0 == nil then
  return mp.CLEAN
end
if string.find(l_0_0, "\\cache\\", 1, true) or string.find(l_0_0, "\\sogoupy\\", 1, true) or string.find(l_0_0, "\\seagull\\drivers\\", 1, true) or string.find(l_0_0, "\\system32\\spool\\printers\\", 1, true) or string.find(l_0_0, "\\filecache", 1, true) or string.find(l_0_0, "\\shadercache\\", 1, true) or string.find(l_0_0, "\\appxprovider.dll", 1, true) or string.find(l_0_0, ".xps", 1, true) then
  return mp.CLEAN
end
local l_0_1 = sysio.GetFileSize(l_0_0)
bm.add_related_string("SuspFileWriteR", tostring(l_0_0), bm.RelatedStringBMReport)
bm.add_related_string("SuspFileWriteR_size", tostring(l_0_1), bm.RelatedStringBMReport)
local l_0_2 = bm.get_current_process_startup_info()
if l_0_2 and l_0_2.integrity_level > MpCommon.SECURITY_MANDATORY_MEDIUM_RID then
  return mp.INFECTED
end
return mp.CLEAN
