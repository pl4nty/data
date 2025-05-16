-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00007cd9_luac 

-- params : ...
-- function num : 0
if peattributes.isexe and peattributes.hasappendeddata and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN

