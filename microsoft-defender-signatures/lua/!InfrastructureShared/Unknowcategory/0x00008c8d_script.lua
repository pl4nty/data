-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00008c8d_luac 

-- params : ...
-- function num : 0
if (mp.getfilesize)() > 100000 and (mp.getfilesize)() < 500000 and not (mp.get_mpattribute)("PEPCODE:HasDigitalSignature") then
  return mp.INFECTED
end
return mp.CLEAN

