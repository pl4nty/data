-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\8750_luac 

-- params : ...
-- function num : 0
if peattributes.enable_vmm_grow and peattributes.no_uidata and peattributes.no_comruntime and (mp.getfilesize)() >= 150000 and (mp.getfilesize)() < 330000 then
  return mp.INFECTED
end
return mp.CLEAN

