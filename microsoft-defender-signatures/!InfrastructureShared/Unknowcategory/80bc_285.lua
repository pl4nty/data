-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\80bc_285.luac 

-- params : ...
-- function num : 0
if (string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_FILENAME)) == "truesight" and (mp.getfilesize)() < 70000 then
  return mp.INFECTED
end
return mp.CLEAN

