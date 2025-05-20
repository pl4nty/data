-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\5820_195.luac 

-- params : ...
-- function num : 0
if peattributes.no_security and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN

