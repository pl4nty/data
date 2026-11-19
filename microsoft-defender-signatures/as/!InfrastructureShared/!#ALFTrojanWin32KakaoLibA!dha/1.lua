-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/KakaoLib.A!dha
-- Type: 10
-- MpAttributes: pea_hasexports & !PEPCODE:HasDigitalSignature

local l_0_0 = {
  "listcmdreplyfiles",
  "deletecmdreplyfile",
  "listcmdsendfiles",
  "listdatafiles",
  "deletedatafile",
  "downloadloginbuffer",
  "downloaddatafile",
  "downloadcmdreplybuffer",
  "initcloudcredential",
  "getclouderrasstring",
  "deletecmdfile",
  "initdirsforlogin",
  "listloginfiles",
  "deleteloginfile",
  "downloadcmdreplyfile",
  "uploadcmdbuffer"
}
local l_0_1 = mp.getfilesize()
if l_0_1 < 512000 or 2097152 < l_0_1 then
  return mp.CLEAN
end
local l_0_2, l_0_3 = pe.get_exports()
local l_0_4 = 0
if l_0_2 < 50 or 80 < l_0_2 then
  return mp.CLEAN
end
for l_0_5 = 1, l_0_2 do
  local l_0_6 = pe.mmap_string_rva(l_0_3[l_0_5].namerva, 64)
  if l_0_6 ~= nil then
    for l_0_7, l_0_8 in ipairs(l_0_0) do
      if string.match(string.lower(l_0_6), l_0_8) then
        l_0_4 = l_0_4 + 1
      end
      if 10 < l_0_4 then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
