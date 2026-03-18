-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaPolinriderST1\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.enum_mpattributesubstring)("SCRT.Polinrider.S")
if #l_0_0 == 8 then
  (mp.set_mpattribute)("Lua:Polinrider.Mal")
else
  if #l_0_0 >= 6 then
    (mp.set_mpattribute)("Lua:Polinrider.Sus")
  else
    if #l_0_0 >= 4 then
      (mp.set_mpattribute)("Lua:Polinrider.Tel")
    end
  end
end
return mp.CLEAN

