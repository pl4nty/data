-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00008406_luac 

-- params : ...
-- function num : 0
local l_0_0 = (string.lower)((mp.getfilename)())
if (string.sub)(l_0_0, -16) == "skypelogview.exe" then
  return mp.CLEAN
end
return mp.LOWFI

