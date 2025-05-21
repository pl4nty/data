-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\7268_257.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)()
if not l_0_0 then
  return mp.CLEAN
end
if (string.find)(l_0_0:lower(), "decrypt", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED

