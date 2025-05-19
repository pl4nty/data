-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\7724_267.luac 

-- params : ...
-- function num : 0
if peattributes.x86_image and peattributes.no_imports_dir and peattributes.relocs_stripped and peattributes.no_imports then
  return mp.INFECTED
end
return mp.CLEAN

