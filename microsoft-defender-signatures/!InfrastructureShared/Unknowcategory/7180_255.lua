-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\7180_255.luac 

-- params : ...
-- function num : 0
if peattributes.x86_image and (pesecs[pehdr.NumberOfSections]).Name == "Zero" then
  return mp.INFECTED
end
return mp.CLEAN

