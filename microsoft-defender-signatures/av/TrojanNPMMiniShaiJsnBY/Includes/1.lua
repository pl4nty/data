-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\TrojanNPMMiniShaiJsnBY\Includes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 == nil or l_0_0 > 5120000 then
  l_0_0 = 5120000
end
;
(mp.readprotection)(false)
do
  local l_0_1, l_0_2, l_0_3, l_0_4 = tostring((mp.readfile)(0, l_0_0)) or ""
  ;
  (mp.readprotection)(true)
  -- DECOMPILER ERROR at PC26: Confused about usage of register: R1 in 'UnsetPending'

  if l_0_1 == "" then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC33: Confused about usage of register: R1 in 'UnsetPending'

  local l_0_5 = nil
  local l_0_6 = (string.lower)(l_0_1)
  local l_0_7 = 0
  local l_0_8 = str_count_match
  local l_0_9 = l_0_6
  l_0_8 = l_0_8(l_0_9, {"snapshotcopydir=async", "getlogindata=async", "collectleveldbfilesunchanged=async", "uploadextensionleveldbtoserver=async", "uploadfile=async", "uploaddirectory=async", "decrypt=async", "getencryptionkey=async", "getsysteminfo=async   ", "snapshotcopydir=async    ", "safermdir=async", "uploadfiletoserver=async", "uploadfoldertoserver=async", "collectleveldbfiles=async", "copyanduploadleveldb=async", "uploaddecryptedextensiondump=async", "getextensiondata=async", "fastsearchenvnative=async", "searchenv=async", "searchpat=async"})
  l_0_7 = l_0_7 + l_0_8
  if l_0_7 < 5 then
    l_0_8 = mp
    l_0_8 = l_0_8.CLEAN
    return l_0_8
  end
  l_0_8 = string
  l_0_8 = l_0_8.find
  l_0_9 = l_0_6
  l_0_8 = l_0_8(l_0_9, "socket_server_url", 1, true)
  if not l_0_8 then
    l_0_8 = string
    l_0_8 = l_0_8.find
    l_0_9 = l_0_6
    l_0_8 = l_0_8(l_0_9, "upload_server_url", 1, true)
    if not l_0_8 then
      l_0_8 = mp
      l_0_8 = l_0_8.CLEAN
      return l_0_8
    end
  end
  l_0_8 = mp
  l_0_8 = l_0_8.INFECTED
  return l_0_8
end

