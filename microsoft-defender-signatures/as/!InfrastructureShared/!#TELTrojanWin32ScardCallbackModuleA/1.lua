-- Threat: !InfrastructureShared
-- Name: !#TEL:Trojan:Win32/ScardCallbackModule.A
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_MZ_DLL & HSTR:ScardCallbackContent

local l_0_0 = versioning.GetOrgID()
local l_0_1 = 100
if type(l_0_0) == "string" then
  l_0_0 = l_0_0:lower()
  if l_0_0 == "26e8b179-9fbe-40fd-8f34-37cdee8c4766" or l_0_0 == "e6e2b814-cd64-4ac3-9e16-91753ff30617" or l_0_0 == "bcfa1838-fccc-4999-9d5b-5ec1ac1a4776" then
    l_0_1 = 25000
  end
end
if versioning.IsSampled(l_0_1, false, false, false) ~= true then
  return mp.CLEAN
end
return mp.INFECTED
