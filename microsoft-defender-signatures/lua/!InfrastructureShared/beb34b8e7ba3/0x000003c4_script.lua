-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\beb34b8e7ba3\0x000003c4_luac 

-- params : ...
-- function num : 0
local l_0_0 = ""
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 then
  l_0_0 = (this_sigattrlog[2]).utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = l_0_0:lower()
if isKnownRansomExtension(l_0_0) then
  return mp.INFECTED
end
return mp.CLEAN

