-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SuspiciousJSfileinDoc\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (string.lower)((mp.getfilename)())
if l_0_0:len() < 14 then
  return mp.CLEAN
end
if (string.match)(l_0_0, "word/embeddings/oleobject%d.+bin.+->.+%.js$") or (string.match)(l_0_0, "ole stream %d.+->.+%.js$") then
  return mp.INFECTED
end
return mp.CLEAN

