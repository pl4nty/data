-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#IGNOREDecodedStub\1.luac 

-- params : ...
-- function num : 0
if (string.sub)((mp.getfilename)(), -16) == "->(EmbeddedCode)" then
  return mp.INFECTED
end
return mp.CLEAN

