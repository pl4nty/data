-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x0000614d_luac 

-- params : ...
-- function num : 0
if (mp.readu_u16)(headerpage, 1) ~= 23117 then
  return mp.INFECTED
end
return mp.CLEAN

