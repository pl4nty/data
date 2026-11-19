-- Threat: !InfrastructureShared
-- Name: 557886a1c859
-- Type: 21

if peattributes.isexe == false then
  return mp.CLEAN
end
if mp.HSTR_WEIGHT >= 12 then
  return mp.INFECTED
else
  mp.set_mpattribute("PUA:Block:IEPassView")
  return mp.CLEAN
end
return mp.CLEAN
