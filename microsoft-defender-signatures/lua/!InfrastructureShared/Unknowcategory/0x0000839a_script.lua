-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x0000839a_luac 

-- params : ...
-- function num : 0
if peattributes.isdll == true and peattributes.no_security == true and (mp.getfilesize)() < 400000 then
  return mp.INFECTED
end
return mp.CLEAN

