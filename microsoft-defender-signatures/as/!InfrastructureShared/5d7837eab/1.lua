-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5d7837eab\1.luac 

-- params : ...
-- function num : 0
if pehdr.SizeOfImage == 245760 then
  return mp.INFECTED
end
;
(mp.changedetectionname)(805306372)
return mp.SUSPICIOUS

