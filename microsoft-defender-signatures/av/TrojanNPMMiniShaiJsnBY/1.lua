-- Threat: Trojan:NPM/MiniShaiJsn.BY
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: RPF:TopLevelFile & SCPT:JS:BitWarden.BA

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0 = mp.getfilesize()
r0_0 = (r0_0 == nil or r0_0 > 5120000) and 5120000 or r0_0
mp.readprotection(false)
local r0_1 = tostring(mp.readfile(0, r0_0)) or ""
mp.readprotection(true)
if r0_1 == "" then
  return mp.CLEAN
end
local r0_2 = string.lower(r0_1)
if 0
  + str_count_match(r0_2,
    {
      "snapshotcopydir=async", "getlogindata=async", "collectleveldbfilesunchanged=async",
      "uploadextensionleveldbtoserver=async", "uploadfile=async", "uploaddirectory=async",
      "decrypt=async", "getencryptionkey=async", "getsysteminfo=async   ",
      "snapshotcopydir=async    ", "safermdir=async", "uploadfiletoserver=async",
      "uploadfoldertoserver=async", "collectleveldbfiles=async", "copyanduploadleveldb=async",
      "uploaddecryptedextensiondump=async", "getextensiondata=async", "fastsearchenvnative=async",
      "searchenv=async", "searchpat=async"
    })
  < 5 then
  return mp.CLEAN
end
local r0_3 = string.find(r0_2, "socket_server_url", 1, true)
if r0_3 or string.find(r0_2, "upload_server_url", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
