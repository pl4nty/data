-- Threat: !InfrastructureShared
-- Name: !#ALF:HackTool:Script/SuspDatFile
-- Type: 24
-- MpAttributes: (RPF:TopLevelFile & Lua:DATExt & BM_UNKNOWN_FILE & Lua:FileInsideSystemFolder & LUA:FileSizeGE1000.A & !LUA:FileSizeGT12M.A)

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = {
  ["avidfosnp.dat"] = "",
  ["fntcache.dat"] = "",
  ["version.dat"] = "",
  ["prfh0804.dat"] = "",
  ["prfc0804.dat"] = "",
  ["prfc0416.dat"] = "",
  ["cloudconfiguration.dat"] = "",
  ["vxautocollimatorrand.dat"] = "",
  ["klick.dat"] = "",
  ["kiln.dat"] = "",
  ["lfont.dat"] = "",
  ["mfont.dat"] = "",
  ["prfh0416.dat"] = "",
  ["eppicprinterdb.dat"] = "",
  ["e4661b94-e45f-42c5-a278-9f3b41ff5522.dat"] = "",
  ["srudb.dat"] = "",
  ["usbcir.dat"] = ""
}
local l_0_2 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1[l_0_2] then
  return mp.CLEAN
end
local l_0_3 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
l_0_3 = MpCommon.PathToWin32Path(l_0_3)
if l_0_3:find("\\windows\\system32\\spool\\drivers\\x64\\3\\", 1, true) or l_0_3:find("\\driverstore\\filerepository\\", 1, true) and l_0_3:find(".inf", 1, true) or l_0_3:find("\\windows\\system32\\ativv", 1, true) or l_0_3:find("\\windows\\system32\\drivers\\dsark.dat", 1, true) or l_0_3:find("\\windows\\system32\\lc.dat", 1, true) or l_0_3:find("\\windows\\system32\\drivers\\mtkwl", 1, true) or l_0_3:find("\\windows\\system32\\perfc", 1, true) or l_0_3:find("\\windows\\system32\\perfh", 1, true) or l_0_3:find("\\windows\\system32\\driverstore\\temp\\", 1, true) or l_0_3:find("\\windows\\system32\\spool\\drivers\\arm64\\3\\", 1, true) or l_0_3:find("zdesigner", 1, true) or l_0_3:find("\\windows\\system32\\spool\\{", 1, true) or l_0_3:find("antiphishing", 1, true) or l_0_3:find("eppicpattern", 1, true) or l_0_3:find("system32\\config\\systemprofile", 1, true) or l_0_3:find("system32\\windowspowershell\\v1.0\\modules\\dbatools", 1, true) then
  return mp.CLEAN
end
local l_0_4 = mp.readheader(0, 257)
local l_0_5 = 0
local l_0_6 = 0
local l_0_7 = 0
local l_0_8 = 0
for l_0_9 = 1, 256 do
  l_0_7 = string.byte(l_0_4, l_0_9)
  l_0_8 = string.byte(l_0_4, l_0_9 + 1)
  if l_0_7 == 0 then
    if l_0_8 == 0 then
      return mp.CLEAN
    end
    l_0_5 = l_0_5 + 1
  end
  if 4 < l_0_5 then
    return mp.CLEAN
  end
  if 32 <= l_0_7 and l_0_7 <= 127 or 9 <= l_0_7 and l_0_7 <= 13 then
    l_0_6 = l_0_6 + 1
  end
  if 180 < l_0_6 then
    return mp.CLEAN
  end
end
return mp.INFECTED
