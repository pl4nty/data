-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x0000848d_luac 

-- params : ...
-- function num : 0
if (mp.getfilesize)() > 10240000 then
  return mp.CLEAN
end
if pehdr.Subsystem == 11 or pehdr.Subsystem == 12 then
  return mp.INFECTED
end
return mp.CLEAN

