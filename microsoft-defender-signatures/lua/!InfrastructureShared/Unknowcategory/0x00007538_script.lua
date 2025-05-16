-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00007538_luac 

-- params : ...
-- function num : 0
if (string.find)((mp.getfilename)(), "%-%>%(VFS%:%d+%.bat%)$") == nil then
  return mp.CLEAN
end
return mp.INFECTED

