-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\6f78727d2\1_luac 

-- params : ...
-- function num : 0
if 0 + pehdr.ImageBase <= (hstrlog[1]).VA and (hstrlog[1]).VA <= 30000 + pehdr.ImageBase and 0 + pehdr.ImageBase <= (hstrlog[2]).VA and (hstrlog[2]).VA <= 30000 + pehdr.ImageBase then
  return mp.INFECTED
end
return mp.CLEAN

