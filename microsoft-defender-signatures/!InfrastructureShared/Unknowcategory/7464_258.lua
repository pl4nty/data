-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\7464_258.luac 

-- params : ...
-- function num : 0
if peattributes.isexe and peattributes.ismsil and peattributes.amd64_image and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN

