-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaPackerX1\1_luac 

-- params : ...
-- function num : 0
if pehdr.NumberOfSections > 5 and (pesecs[1]).SizeOfRawData == 0 and (pesecs[2]).SizeOfRawData == 0 and (pesecs[3]).SizeOfRawData == 0 then
  return mp.INFECTED
end
return mp.CLEAN

