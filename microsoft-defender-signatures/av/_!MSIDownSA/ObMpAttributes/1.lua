-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!MSIDownSA\ObMpAttributes\1.luac 

-- params : ...
-- function num : 0
if (mp.readu_u64)(headerpage, 1) ~= -2.2262717569742e+18 then
  return mp.CLEAN
end
if (mp.get_contextdata)(mp.CONTEXT_DATA_HAS_MOTW_ADS) ~= true then
  return mp.CLEAN
end
if (mp.GetMOTWZone)() < 3 then
  return mp.CLEAN
end
local l_0_0 = (mp.GetMOTWHostUrl)()
if l_0_0 ~= nil and (string.find)(l_0_0, ".email", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN

