-- Threat: !InfrastructureShared
-- Name: !#Lua:PowerShell.SysetmBC.S1
-- Type: 13
-- MpAttributes: AGGR.SystemBC.SA4105

local l_0_0 = mp.enum_mpattributesubstring("SCPT:PS.SystemBC.SA0.")
if 4 <= #l_0_0 then
  mp.set_mpattribute("Lua:PowerShell.SysetmBC.BadS1")
  return mp.INFECTED
elseif l_0_0 == 3 then
  mp.set_mpattribute("Lua:PowerShell.SysetmBC.S2")
  return mp.CLEAN
end
return mp.CLEAN
