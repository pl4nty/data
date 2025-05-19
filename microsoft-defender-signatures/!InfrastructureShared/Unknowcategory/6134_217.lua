-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6134_217.luac 

-- params : ...
-- function num : 0
if peattributes.ismsil and peattributes.x86_image and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN

