-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x000003d4_luac 

-- params : ...
-- function num : 0
if (string.lower)((string.sub)((bm.get_imagepath)(), -13)) == "\\wmiprvse.exe" then
  return mp.INFECTED
end
return mp.CLEAN

