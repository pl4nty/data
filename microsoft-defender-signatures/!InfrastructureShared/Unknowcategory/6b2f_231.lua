-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6b2f_231.luac 

-- params : ...
-- function num : 0
if peattributes.x86_image and peattributes.relocs_stripped and peattributes.no_exports then
  return mp.INFECTED
end
return mp.CLEAN

