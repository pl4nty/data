-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaIOAVZipxOpenByRAR\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME))
if l_0_0 == "rar.exe" then
  local l_0_1 = (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)
  local l_0_2 = "ZipXByIOAV"
  local l_0_3 = (MpCommon.QueryPersistContext)(l_0_1, l_0_2)
  if l_0_3 then
    (mp.set_mpattribute)("MpDisableCaching")
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

