-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\9d41_382.luac 

-- params : ...
-- function num : 0
if peattributes.isdll == true and peattributes.hasexports == true and (pesecs[4]).Name == ".fptable" and (pesecs[4]).Characteristics == 3221225536 and (mp.getfilesize)() >= 5000000 and (mp.getfilesize)() <= 20000000 then
  return mp.INFECTED
end
return mp.CLEAN

