-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6aa2_229.luac 

-- params : ...
-- function num : 0
if (pesecs[1]).VirtualSize > 20480 and (pesecs[1]).VirtualAddress == 4096 then
  return mp.INFECTED
end
return mp.CLEAN

