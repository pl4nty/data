-- Threat: !InfrastructureShared
-- Name: !#LoD:Lua:PossibleShellter
-- Type: 8
-- MpAttributes: RPF:TopLevelFile

if pehdr.DllCharacteristics ~= 0 then
  return mp.CLEAN
end
if peattributes.isexe ~= true then
  return mp.CLEAN
end
if pehdr.DataDirectory[4].RVA ~= 0 or pehdr.DataDirectory[4].Size ~= 0 then
  return mp.CLEAN
end
if pehdr.Machine ~= 332 then
  return mp.CLEAN
end
return mp.INFECTED
