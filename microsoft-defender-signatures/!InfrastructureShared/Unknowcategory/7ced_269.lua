-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\7ced_269.luac 

-- params : ...
-- function num : 0
if peattributes.ismsil == true and peattributes.isdll == false and peattributes.no_security == true and (mp.getfilesize)() < 33000 then
  return mp.INFECTED
end
return mp.CLEAN

