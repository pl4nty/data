-- Threat: !InfrastructureShared
-- Name: !#TEL:Supicious:BigVBSFile.S001
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_UNKNOWN_FILE & LUA:FileSizeGT20M.A

if mp.readu_u32(headerpage, 1) > 536870912 and mp.readu_u32(headerpage, 1) < 553648128 then
  mp.readprotection(false)
  local l_0_0 = mp.readfile(0, 4)
  local l_0_1 = string.lower(tostring(l_0_0))
  if string.find(l_0_1, "rem ", 1, true) ~= nil then
    return mp.INFECTED
  end
end
mp.set_mpattribute("Lua:UnknownBigFile_GT20M")
return mp.CLEAN
