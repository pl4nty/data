-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\17d0861757af\0x0000c2d1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 < 8192 or l_0_0 > 13631488 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_1 = (mp.readfile)(4096, 4096)
if (mp.readu_u32)(l_0_1, 1) ~= 1852400232 then
  return mp.CLEAN
end
if (mp.readu_u32)(l_0_1, 113) ~= 1414483794 then
  return mp.CLEAN
end
if (string.find)(l_0_1, "\000SAM\000", 1, true) then
  (mp.set_mpattribute)("BM_REGHIVE_SAM")
else
  if (string.find)(l_0_1, "\000Cache\000", 1, true) then
    (mp.set_mpattribute)("BM_REGHIVE_SECURITY")
  else
    if (string.find)(l_0_1, "ActivationBroker", 1, true) then
      (mp.set_mpattribute)("BM_REGHIVE_SYSTEM")
    else
      return mp.CLEAN
    end
  end
end
local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_2 and IsKeyInRollingQueue("PPIDRollingQueue", l_0_2, true) then
  (mp.set_mpattribute)("PPIDRollingQueueMatched")
end
return mp.INFECTED

