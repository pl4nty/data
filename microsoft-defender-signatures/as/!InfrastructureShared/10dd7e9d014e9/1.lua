-- Threat: !InfrastructureShared
-- Name: 10dd7e9d014e9
-- Type: 21

local l_0_0 = versioning.GetOrgID()
if l_0_0 ~= nil and l_0_0 ~= "" then
  l_0_0 = string.lower(l_0_0)
end
if l_0_0 == "1beec53c-4b52-4aec-a1b1-716d6da36984" or l_0_0 == "e7fdafff-652b-46c3-9f36-a510e063c2d5" or l_0_0 == "891a4168-8094-4df0-bb27-f44256f9f5ca" or l_0_0 == "c7d52edc-7d78-41dd-9aec-9300e5d3b607" or l_0_0 == "cdee90ad-b11a-4938-95f6-cee7775f12d6" then
  return mp.INFECTED
else
  return mp.CLEAN
end
return mp.CLEAN
