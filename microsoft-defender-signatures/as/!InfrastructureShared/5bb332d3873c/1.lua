-- Threat: !InfrastructureShared
-- Name: 5bb332d3873c
-- Type: 21

local l_0_0 = versioning.GetOrgID()
if l_0_0 == nil or type(l_0_0) ~= "string" then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if l_0_0 ~= "399860c4-b0ea-40c1-a834-7463bf290b5d" and (l_0_0 ~= "d7c7c745-195f-4223-9c7a-99fb420fd000" or versioning.IsSampled(1000, false, true, true) ~= true) and versioning.IsSampled(10, false, false, false) ~= true then
  return mp.CLEAN
end
return mp.INFECTED
