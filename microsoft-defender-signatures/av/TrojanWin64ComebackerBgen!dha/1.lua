-- Threat: Trojan:Win64/Comebacker.B.gen!dha
-- Type: 10
-- MpAttributes: pea_isdll & pea_hasexports

local l_0_0, l_0_1 = pe.get_exports()
if 3 < l_0_0 then
  return mp.CLEAN
end
local l_0_2 = {
  DllMain = 10,
  ASN2_TYPE_new = 1,
  ASN2_TYPE_newW = 1,
  CleanupBrokerString = 1,
  cmsSetLogHandlerTHR = 1,
  deflateSuffix = 1,
  ENGINE_get_RAND = 1,
  ENGINE_get_RANDW = 1,
  glInitSampler = 1,
  json_object_get_unicode_string = 1,
  ntSystemInfo = 1,
  ntWindowsProc = 1,
  SetWebFilterString = 1,
  sql_blob_open = 1,
  SSL_HandShaking = 1
}
local l_0_3 = 0
for l_0_4 = 1, l_0_0 do
  local l_0_5 = pe.mmap_string_rva(l_0_1[l_0_4].namerva, 64)
  if l_0_2[l_0_5] ~= nil then
    l_0_3 = l_0_3 + l_0_2[l_0_5]
  end
end
if l_0_3 == 10 then
  return mp.CLEAN
elseif 11 <= l_0_3 then
  return mp.INFECTED
elseif 0 < l_0_3 then
  local l_0_6 = {
    [".bin"] = true,
    [".cpl"] = true,
    [".dat"] = true,
    [".db"] = true
  }
  local l_0_7 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_6[l_0_7:sub(-3)] ~= nil or l_0_6[l_0_7:sub(-4)] ~= nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
