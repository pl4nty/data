-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaDllOnOpenByEXEInTempFolder\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSDEVICEPATH)
if not l_0_0 or not l_0_1 then
  return mp.CLEAN
end
l_0_0 = normalize_path(l_0_0)
l_0_1 = normalize_path((string.lower)(l_0_1))
if not l_0_0 or not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = "Lua:DllOnOpenByEXEInTempFolder!"
local l_0_3 = l_0_1:gsub("\\+$", "")
local l_0_4 = l_0_0:gsub("\\+$", "")
if l_0_4 and l_0_4 == l_0_3 then
  l_0_2 = l_0_2 .. "SameFolder_"
else
  l_0_2 = l_0_2 .. "DiffFolder_"
end
local l_0_5 = (mp.get_contextdata)(mp.CONTEXT_DATA_DESIREDACCESS)
if l_0_5 and (mp.bitand)(l_0_5, 32) == 32 then
  l_0_2 = l_0_2 .. "EXEC_"
else
  l_0_2 = l_0_2 .. "NOEXEC_"
end
if (mp.get_mpattribute)("BM_HAS_DIGITALSIGNATURE") then
  l_0_2 = l_0_2 .. "HAS_SIG"
else
  l_0_2 = l_0_2 .. "UNSIG"
end
;
(mp.set_mpattribute)(l_0_2)
return mp.INFECTED

