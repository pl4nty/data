-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\9471_362.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if peattributes.ismsil == true and peattributes.no_security == true and l_0_0 <= 53248 and l_0_0 >= 36864 and peattributes.isdll == true and (mp.get_mpattribute)("Trojan:MSIL/MalInject.A!MTB") then
  return mp.INFECTED
end
return mp.CLEAN

