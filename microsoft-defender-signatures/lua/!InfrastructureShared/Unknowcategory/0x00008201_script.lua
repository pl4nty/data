-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00008201_luac 

-- params : ...
-- function num : 0
if (mp.getfilesize)() < 54000 and peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN

