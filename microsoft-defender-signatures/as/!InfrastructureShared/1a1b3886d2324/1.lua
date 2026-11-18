-- Threat: !InfrastructureShared
-- Name: 1a1b3886d2324
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker, LuaFuncHelper

local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = {}
local l_0_2 = 150000000
local l_0_3 = bm.GetSignatureMatchDuration()
if l_0_2 < l_0_3 then
  return mp.CLEAN
end
if this_sigattrlog[2].matched and this_sigattrlog[2].wp2 ~= nil then
  local l_0_4 = string.lower(this_sigattrlog[2].utf8p2)
  if l_0_4 and this_sigattrlog[2].matched and string.find(l_0_4, "copy-as-is", 1, true) and string.find(l_0_4, "/usr/share/rear", 1, true) then
    return mp.CLEAN
  end
end
local l_0_5 = 0
for l_0_6 = 1, l_0_0 do
  local l_0_7 = sigattr_tail[l_0_6].attribute
  if l_0_7 == 16388 then
    local l_0_8 = sigattr_tail[l_0_6].utf8p1
    if l_0_8 ~= nil and l_0_8 ~= "" and l_0_1[l_0_8] == nil and (isSensitiveFileForLinux(l_0_8) or string.find(l_0_8, ".pfx", -4, true) or string.find(l_0_8, ".key", -4, true) or string.find(l_0_8, ".ppk", -4, true) or string.find(l_0_8, ".keytab", 1, true) or string.find(l_0_8, ".htpasswd", 1, true) or string.find(l_0_8, "/private-keys-v1.d", 1, true) or string.find(l_0_8, "/secring.gpg", 1, true)) then
      l_0_1[l_0_8] = true
      bm.add_related_file(l_0_8)
      l_0_5 = l_0_5 + 1
    end
  end
end
if 10 <= l_0_5 then
  TrackPidAndTechniqueBM("BM", "T1560", "Collection_SensitiveFilesOpen")
  TrackPidAndTechniqueBM("BM", "T1552", "CredentialAccess")
  addRelatedProcess()
  reportRelatedBmHits()
  local l_0_9 = safeJsonSerialize(l_0_1)
  bm.add_related_string("file_metadata", l_0_9, bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN
