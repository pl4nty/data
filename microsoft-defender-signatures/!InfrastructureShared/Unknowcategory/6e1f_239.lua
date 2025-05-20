-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6e1f_239.luac 

-- params : ...
-- function num : 0
if ((mp.getfilename)()):match("/embeddings/oleObject") then
  (mp.changedetectionname)(805306516)
  return mp.INFECTED
end
return mp.INFECTED

