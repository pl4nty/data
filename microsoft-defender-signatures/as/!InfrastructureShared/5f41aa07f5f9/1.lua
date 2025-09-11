-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5f41aa07f5f9\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (nri.GetRawResponseBlob)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = #l_0_0
if l_0_1 < 48 then
  return mp.CLEAN
end
local l_0_2 = 16432
local l_0_3 = (mp.bswap32)((mp.readu_u32)(l_0_0, 21))
if (mp.bitand)(l_0_3, l_0_2) == l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN

