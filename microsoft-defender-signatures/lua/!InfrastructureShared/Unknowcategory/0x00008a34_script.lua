-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00008a34_luac 

-- params : ...
-- function num : 0
if peattributes.isvbnative == true then
  (pe.set_image_filename)("C:\\temp\\myapp.exe")
  ;
  (pe.reemulate)()
  return mp.INFECTED
end
return mp.CLEAN

