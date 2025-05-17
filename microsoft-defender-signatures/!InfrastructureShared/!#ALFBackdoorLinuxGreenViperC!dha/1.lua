-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFBackdoorLinuxGreenViperC!dha\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 > 32768 then
  return mp.CLEAN
end
local l_0_1 = (mp.get_mpattributevalue)("Lua:POSSIBLE_UPX_MAGIC")
if l_0_1 == nil then
  return mp.CLEAN
end
if (mp.bitand)(l_0_1, 558056007) == 558056007 or (mp.bitand)(l_0_1, 558056001) == 558056001 then
  return mp.INFECTED
end
return mp.CLEAN

