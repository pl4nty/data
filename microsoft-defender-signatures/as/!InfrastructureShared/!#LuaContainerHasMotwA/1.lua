-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaContainerHasMotwA\1.luac 

-- params : ...
-- function num : 0
if (mp.get_contextdata)(mp.CONTEXT_DATA_HAS_MOTW_ADS) and (mp.GetMOTWZone)() >= 3 then
  (mp.UfsSetMetadataBool)("Lua:ContainerHasMotw.A", true)
  local l_0_0 = (mp.getfilesize)()
  if l_0_0 < 1024 and (mp.get_mpattribute)("LuaZipWithSingleJS") then
    (mp.set_mpattribute)("MpForceScanArchives")
  end
  return mp.INFECTED
end
do
  return mp.CLEAN
end

