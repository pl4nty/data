-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanJSObfuseSS\0x000017a3_luac 

-- params : ...
-- function num : 0
if (mp.get_contextdata)(mp.CONTEXT_DATA_HAS_MOTW_ADS) ~= true then
  return mp.CLEAN
end
if (mp.GetMOTWZone)() < 3 then
  return mp.CLEAN
end
local l_0_0 = (mp.GetMOTWHostUrl)()
if l_0_0 ~= nil then
  l_0_0 = (string.lower)(l_0_0)
  if (string.find)(l_0_0, ".sbs/lander/", 1, true) and (string.find)(l_0_0, "download.php", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN

