-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6f9_229.luac 

-- params : ...
-- function num : 0
if (string.lower)((string.sub)((mp.getfilename)(), -4)) == ".lnk" then
  return mp.INFECTED
end
return mp.CLEAN

