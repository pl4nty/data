-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00009e9f_luac 

-- params : ...
-- function num : 0
if (pesecs[4]).Name == ".rsrc" and (mp.bitand)((pesecs[4]).Characteristics, 3221487648) == 3221487648 then
  return mp.INFECTED
end
;
(mp.set_mpattribute)("HSTR:Win32/Nabucur.01")
return mp.CLEAN

