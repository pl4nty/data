-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4d78c1739\1.luac 

-- params : ...
-- function num : 0
if (mp.getfilesize)() < 197000 then
  return mp.SUSPICIOUS
end
return mp.CLEAN

