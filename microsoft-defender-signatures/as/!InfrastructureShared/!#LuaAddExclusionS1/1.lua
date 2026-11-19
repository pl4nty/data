-- Threat: !InfrastructureShared
-- Name: !#Lua:AddExclusion.S1
-- Type: 13
-- MpAttributes: AGGR:AddExclusion.SA

local l_0_0 = 0
if mp.get_mpattribute("SCPT:Exclusive.Programfilesx86.S01") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCPT:Exclusive.Programfilesx86.S02") or mp.get_mpattribute("SCPT:BAT/BatLoader.B3") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCPT:Exclusive.programdata.S01") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCPT:Exclusive.programdata.S02") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCPT:Exclusive.EdgeExtension.S01") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCPT:Exclusive.EdgeExtension.S02") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCPT:Exclusive.TempA.S01") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCPT:Exclusive.TempA.S02") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCPT:Exclusive.TempB.S01") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCPT:Exclusive.TempB.S02") then
  l_0_0 = l_0_0 + 1
end
if 3 <= l_0_0 and l_0_0 < 100 then
  return mp.INFECTED
end
return mp.CLEAN
