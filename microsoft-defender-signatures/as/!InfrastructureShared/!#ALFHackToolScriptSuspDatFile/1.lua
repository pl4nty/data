-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFHackToolScriptSuspDatFile\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = {}
l_0_1["avidfosnp.dat"] = ""
l_0_1["fntcache.dat"] = ""
l_0_1["version.dat"] = ""
l_0_1["prfh0804.dat"] = ""
l_0_1["prfc0804.dat"] = ""
l_0_1["prfc0416.dat"] = ""
l_0_1["cloudconfiguration.dat"] = ""
l_0_1["vxautocollimatorrand.dat"] = ""
l_0_1["klick.dat"] = ""
l_0_1["kiln.dat"] = ""
l_0_1["lfont.dat"] = ""
l_0_1["mfont.dat"] = ""
l_0_1["prfh0416.dat"] = ""
l_0_1["eppicprinterdb.dat"] = ""
l_0_1["e4661b94-e45f-42c5-a278-9f3b41ff5522.dat"] = ""
l_0_1["srudb.dat"] = ""
l_0_1["usbcir.dat"] = ""
local l_0_2 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1[l_0_2] then
  return mp.CLEAN
end
local l_0_3 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
l_0_3 = (MpCommon.PathToWin32Path)(l_0_3)
-- DECOMPILER ERROR at PC186: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC186: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC186: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC186: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC186: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC186: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC186: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC186: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC186: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC186: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC186: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC186: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC186: Unhandled construct in 'MakeBoolean' P3

if l_0_3:find("\\windows\\system32\\spool\\drivers\\x64\\3\\", 1, true) or ((l_0_3:find("\\driverstore\\filerepository\\", 1, true) and l_0_3:find(".inf", 1, true)) or l_0_3:find("system32\\windowspowershell\\v1.0\\modules\\dbatools", 1, true)) then
  return mp.CLEAN
end
local l_0_4 = (mp.readheader)(0, 257)
local l_0_5 = 0
local l_0_6 = 0
local l_0_7 = 0
local l_0_8 = 0
for l_0_12 = 1, 256 do
  l_0_7 = (string.byte)(l_0_4, l_0_12)
  l_0_8 = (string.byte)(l_0_4, l_0_12 + 1)
  if l_0_7 == 0 then
    if l_0_8 == 0 then
      return mp.CLEAN
    end
    l_0_5 = l_0_5 + 1
  end
  if l_0_5 > 4 then
    return mp.CLEAN
  end
  if (l_0_7 >= 32 and l_0_7 <= 127) or l_0_7 >= 9 and l_0_7 <= 13 then
    l_0_6 = l_0_6 + 1
  end
  if l_0_6 > 180 then
    return mp.CLEAN
  end
end
return mp.INFECTED

