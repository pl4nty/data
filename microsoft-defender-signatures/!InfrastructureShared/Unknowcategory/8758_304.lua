-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\8758_304.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)()
if (string.find)(l_0_0, "odbior_1000%d%d%d%d%d%d%d%d%dU.vbs") ~= nil or (string.find)(l_0_0, "przesylka_1000%d%d%d%d%d%d%d%d%dU.vbs") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN

