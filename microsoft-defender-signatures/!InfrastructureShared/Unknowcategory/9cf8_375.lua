-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\9cf8_375.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if peattributes.no_security == true and l_0_0 >= 520192 and l_0_0 <= 589824 and pehdr.NumberOfSections >= 3 and pehdr.NumberOfSections <= 5 and (pesecs[2]).Name == ".jnbcf" then
  return mp.INFECTED
end
return mp.CLEAN

