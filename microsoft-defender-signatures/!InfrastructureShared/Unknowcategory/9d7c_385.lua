-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\9d7c_385.luac 

-- params : ...
-- function num : 0
if pehdr.NumberOfSections > 4 then
  return mp.CLEAN
end
local l_0_0 = (mp.getfilesize)()
if l_0_0 > 5242880 then
  return mp.CLEAN
end
for l_0_4 = 1, pehdr.NumberOfSections do
  if (string.lower)(tostring((pesecs[l_0_4]).Name)) == ".shell" then
    return mp.INFECTED
  end
end
return mp.CLEAN

