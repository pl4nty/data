-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2678751e8\1.luac 

-- params : ...
-- function num : 0
if pehdr.SizeOfImage > 2031616 and pehdr.SizeOfImage < 2097152 then
  (mp.changedetectionname)(805306373)
  return mp.INFECTED
end
return mp.SUSPICIOUS

