-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x000047c9_luac 

-- params : ...
-- function num : 0
if (hstrlog[2]).hitcount >= 10 then
  return mp.INFECTED
end
return mp.CLEAN

