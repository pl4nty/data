-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6187_luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("pea_isdll") and (mp.get_mpattribute)("pea_amd64_image") then
  return mp.INFECTED
end
return mp.CLEAN

