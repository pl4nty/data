-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaGenRansomEntropyCalcA\1_luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("Lua:EntropyCalculated") then
  return mp.CLEAN
end
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1, l_0_2 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = (mp.getfilesize)()
if l_0_3 == nil or l_0_3 > 16777216 then
  return mp.CLEAN
end
local l_0_4 = l_0_1 .. "\\" .. l_0_2
local l_0_5 = (MpCommon.PathToWin32Path)(l_0_4)
local l_0_6 = GetFileEntropy(l_0_5, l_0_3)
if l_0_6 ~= nil then
  (mp.set_mpattribute)("Lua:EntropyCalculated")
  if l_0_6 > 6 then
    if (mp.get_mpattribute)("BM_UNKNOWN_FILE") then
      (MpCommon.BmTriggerSig)(l_0_0, "FileEntropy", (string.format)("filepath:%s;entropy:%s;filetype:unknown", l_0_5, tostring(l_0_6)))
    else
      ;
      (MpCommon.BmTriggerSig)(l_0_0, "FileEntropy", (string.format)("filepath:%s;entropy:%s", l_0_5, tostring(l_0_6)))
    end
  end
  return mp.INFECTED
end
return mp.CLEAN

