-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x0000984d_luac 

-- params : ...
-- function num : 0
if pehdr.NumberOfSections == 7 and (pesecs[4]).Name == ".fuckyou" and (pesecs[5]).Name == ".fuckyou" and (pesecs[6]).Name == ".fuckyou" then
  return mp.INFECTED
end
return mp.CLEAN

