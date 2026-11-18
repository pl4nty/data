-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Linux/EmbeddedElf
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_UNKNOWN_FILE & SCPT:ElfCommonHeaderString & LUA:FileSizeGE1000.A & LUA:FileSizeLE4M.B

if mp.HEADERPAGE_SZ < 4096 then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find(",v", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("program files", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("\\vfscache\\", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("smartstage", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("xl.meta", 1, true) then
  return mp.CLEAN
end
if l_0_0:find(".pb", 1, true) then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = 0
for l_0_2 = 1, mp.HEADERPAGE_SZ - 4 do
  if mp.readu_u32(headerpage, l_0_2) == 1179403647 then
    local l_0_3 = mp.readu_u32(headerpage, l_0_2 + 4)
    if l_0_3 == 65794 or l_0_3 == 65793 then
      l_0_1 = l_0_2 - 1
      break
    end
  end
end
if l_0_1 ~= 0 then
  mp.readprotection(true)
  return mp.INFECTED
end
mp.readprotection(true)
return mp.CLEAN
