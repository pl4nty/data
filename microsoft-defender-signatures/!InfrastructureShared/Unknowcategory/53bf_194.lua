-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\53bf_194.luac 

-- params : ...
-- function num : 0
if peattributes.x86_image and peattributes.no_exports then
  return mp.INFECTED
end
return mp.CLEAN

