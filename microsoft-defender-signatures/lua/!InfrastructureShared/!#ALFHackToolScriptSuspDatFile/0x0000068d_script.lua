-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFHackToolScriptSuspDatFile\0x0000068d_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
l_0_1 = (MpCommon.PathToWin32Path)(l_0_1)
-- DECOMPILER ERROR at PC103: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC103: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC103: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC103: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC103: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC103: Unhandled construct in 'MakeBoolean' P3

if l_0_1:find("\\windows\\system32\\spool\\drivers\\x64\\3\\", 1, true) or ((l_0_1:find("\\driverstore\\filerepository\\", 1, true) and l_0_1:find(".inf", 1, true)) or l_0_1:find("\\windows\\system32\\driverstore\\temp\\", 1, true)) then
  return mp.CLEAN
end
local l_0_2 = (mp.readheader)(0, 257)
local l_0_3 = 0
local l_0_4 = 0
local l_0_5 = 0
local l_0_6 = 0
for l_0_10 = 1, 256 do
  l_0_5 = (string.byte)(l_0_2, l_0_10)
  l_0_6 = (string.byte)(l_0_2, l_0_10 + 1)
  if l_0_5 == 0 then
    if l_0_6 == 0 then
      return mp.CLEAN
    end
    l_0_3 = l_0_3 + 1
  end
  if l_0_3 > 4 then
    return mp.CLEAN
  end
  if (l_0_5 >= 32 and l_0_5 <= 127) or l_0_5 >= 9 and l_0_5 <= 13 then
    l_0_4 = l_0_4 + 1
  end
  if l_0_4 > 180 then
    return mp.CLEAN
  end
end
return mp.INFECTED

