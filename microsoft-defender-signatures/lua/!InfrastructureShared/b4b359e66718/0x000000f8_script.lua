-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\b4b359e66718\0x000000f8_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p2 and reportGenericRansomware((this_sigattrlog[5]).utf8p2) == mp.INFECTED then
  return mp.INFECTED
end
return mp.CLEAN

