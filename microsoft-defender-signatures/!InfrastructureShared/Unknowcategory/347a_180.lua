-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\347a_180.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("GenericAllowlist") then
  return mp.CLEAN
end
return mp.INFECTED

