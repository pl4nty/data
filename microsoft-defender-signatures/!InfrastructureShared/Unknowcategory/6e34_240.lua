-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6e34_240.luac 

-- params : ...
-- function num : 0
if (mp.IsTrustedFile)(false) == true or (mp.IsKnownFriendlyFile)((mp.getfilename)(), true, true) == true then
  return mp.CLEAN
end
return mp.INFECTED

