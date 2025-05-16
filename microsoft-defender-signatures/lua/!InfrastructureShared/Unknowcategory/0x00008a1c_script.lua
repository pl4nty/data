-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00008a1c_luac 

-- params : ...
-- function num : 0
if peattributes.ismsil and peattributes.isexe and peattributes.hasappendeddata and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN

