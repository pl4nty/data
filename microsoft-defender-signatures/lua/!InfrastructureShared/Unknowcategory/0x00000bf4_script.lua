-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00000bf4_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if l_0_0 ~= nil then
  l_0_0 = (string.lower)(l_0_0)
  if (string.sub)(l_0_0, -12) == "regsvr32.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN

