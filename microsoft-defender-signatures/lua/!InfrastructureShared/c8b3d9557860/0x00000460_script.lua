-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\c8b3d9557860\0x00000460_luac 

-- params : ...
-- function num : 0
local l_0_0 = mp.CLEAN
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
  l_0_0 = reportGenericRansomware((this_sigattrlog[1]).utf8p2)
end
if l_0_0 == mp.INFECTED then
  return mp.INFECTED
end
return mp.CLEAN

