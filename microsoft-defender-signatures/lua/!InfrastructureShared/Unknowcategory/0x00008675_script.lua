-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00008675_luac 

-- params : ...
-- function num : 0
if (hstrlog[1]).hitcount == 1 or (hstrlog[2]).hitcount == 1 or (hstrlog[3]).hitcount == 1 or (hstrlog[4]).hitcount == 1 then
  return mp.INFECTED
end
return mp.CLEAN

