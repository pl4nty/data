-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x000098aa_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = (string.sub)(l_0_0, -10)
if l_0_1 and (string.lower)(l_0_1) == "\\mshta.exe" then
  return mp.INFECTED
end
return mp.CLEAN

