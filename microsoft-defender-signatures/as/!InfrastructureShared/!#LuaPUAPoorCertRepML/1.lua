-- Threat: !InfrastructureShared
-- Name: !#Lua:PUAPoorCertRepML
-- Type: 9

if mp.get_mpattributesubstring("PUA:ML:Blocked:") then
  mp.set_mpattribute("Lua:PUAPoorCertRepML")
end
if mp.get_mpattributesubstring("PUA:ML:Staged:") then
  mp.set_mpattribute("Lua:PUAPoorCertRepMLStaged")
end
return mp.CLEAN
