-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/Tavdig.C!dha
-- Type: 13
-- MpAttributes: BM_TEXT_FILE & Lua:TMPExt & (SCPT:TavdigConfig.A | SCPT:TavdigConfig.B | SCPT:TavdigConfig.C | SCPT:TavdigConfig.D | SCPT:TavdigConfig.E) & Lua:FileInsideAppDataLocalTempFolder & (LUA:FileSizeLE100.A | LUA:FileSizeLE200.A | LUA:FileSizeLE400.A | LUA:FileSizeLE800.A | LUA:FileSizeLE1000.A)

local l_0_0, l_0_1 = pcall(mp.getfilename, mp.FILEPATH_QUERY_FNAME)
if l_0_0 then
  if #l_0_1 ~= 10 then
    return mp.CLEAN
  end
  local l_0_2 = l_0_1:sub(1, 2)
  if l_0_2 ~= "~D" then
    return mp.CLEAN
  end
  local l_0_3 = mp.readheader(0, 8)
  if l_0_3 == "[CONFIG]" then
    return mp.INFECTED
  end
end
return mp.CLEAN
