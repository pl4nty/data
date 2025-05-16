-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaPowerShellSysetmBCS1\0x00001658_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.enum_mpattributesubstring)("SCPT:PS.SystemBC.SA0.")
if #l_0_0 >= 4 then
  (mp.set_mpattribute)("Lua:PowerShell.SysetmBC.BadS1")
  return mp.INFECTED
else
  if l_0_0 == 3 then
    (mp.set_mpattribute)("Lua:PowerShell.SysetmBC.S2")
    return mp.CLEAN
  end
end
return mp.CLEAN

