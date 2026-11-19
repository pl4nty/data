-- Threat: !InfrastructureShared
-- Name: !#Lua:VulDrvAsrPvtPreviewOrg
-- Type: 12

local l_0_0 = versioning.GetOrgID()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if l_0_0 == "d7c7c745-195f-4223-9c7a-99fb420fd000" then
  return mp.INFECTED
end
if l_0_0 == "e3f145c1-6df4-4596-95d4-cf288db50a67" then
  return mp.INFECTED
end
if l_0_0 == "1f5471db-58e9-40c6-8dcf-af012fded923" then
  return mp.INFECTED
end
if l_0_0 == "6f7a14dd-0adc-43d6-b56d-f2f77f3bdeaa" then
  return mp.INFECTED
end
if l_0_0 == "a9c920a5-93c5-4cfd-9bae-8bb9e0c01d74" then
  return mp.INFECTED
end
return mp.CLEAN
