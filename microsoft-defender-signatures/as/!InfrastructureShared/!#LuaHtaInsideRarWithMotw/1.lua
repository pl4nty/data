-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaHtaInsideRarWithMotw\1.luac 

-- params : ...
-- function num : 0
if (mp.UfsGetMetadataBool)("Lua:FileInRar", true) ~= 0 or not "Lua:FileInRar" then
  return mp.CLEAN
end
if (mp.get_contextdata)(mp.CONTEXT_DATA_HAS_MOTW_ADS) == true and (mp.GetMOTWZone)() >= 3 then
  return mp.INFECTED
end
return mp.CLEAN

