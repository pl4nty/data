-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\7fb7_273.luac 

-- params : ...
-- function num : 0
if ((hstrlog[1]).matched and not (hstrlog[2]).matched) or 0 + (hstrlog[1]).hitcount + (hstrlog[2]).hitcount >= 5 then
  return mp.INFECTED
end
return mp.CLEAN

