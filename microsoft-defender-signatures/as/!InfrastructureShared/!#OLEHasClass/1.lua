-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#OLEHasClass\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (string.lower)((mp.getfilename)())
if l_0_0:len() < 17 then
  return mp.CLEAN
end
if (string.find)(l_0_0, "word/embeddings/oleobject%d.+bin.+->.+%.class$") or (string.find)(l_0_0, "ole stream %d.+->.+%.class$") then
  return mp.INFECTED
end
return mp.CLEAN

