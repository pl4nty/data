-- Threat: !InfrastructureShared
-- Name: SCCReleaseSelection
-- Type: 23

function is_feature_off_on_orgs(l_1_0)
  local l_1_1 = {}
  
  return l_1_1[l_1_0] == true
end

function is_allowed_scc_test_orgs(l_2_0)
  local l_2_1 = {
    ["be9a517d-d0f8-43f5-8027-59f701c80811"] = true,
    ["62eb59de-b6ee-46f6-9f2d-5e62bb2bb9c7"] = true,
    ["51781acf-7c9a-4d4b-94e7-11cd4d3f4be4"] = true,
    ["26fc31af-cba6-4436-ad51-20029d2a78b7"] = true,
    ["aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"] = true,
    ["2706da41-bffd-42ec-a757-b41255209959"] = true
  }
  return l_2_1[l_2_0] == true
end

if versioning.GetHostOsType() ~= 1 or versioning.GetPlatform() ~= 6 then
  return
end
if versioning.GetPlatformBuild() < 1705902080 then
  database.LoadDBVar(database.DBVAR_DW, "DCO_MpFC_SCC_FeatureAvailable", 0, 1, 1)
  return
end
local l_0_0 = versioning.GetOrgID()
if not l_0_0 or l_0_0 == "" then
  return
end
l_0_0 = l_0_0:lower()
database.LoadDBVar(database.DBVAR_DW, "DCO_MpFC_SCC_VerifyPayloadSignature", 4294967279, 1, 1)
if is_feature_off_on_orgs(l_0_0) == true then
  database.LoadDBVar(database.DBVAR_DW, "DCO_MpFC_SCC_FeatureAvailable", 0, 1, 1)
  return
end
if is_allowed_scc_test_orgs(l_0_0) == true then
  database.LoadDBVar(database.DBVAR_DW, "DCO_MpFC_SCC_EnableEarlyInit", 1, 1, 1)
  database.LoadDBVar(database.DBVAR_DW, "DCO_MpFC_SCC_FeatureAvailable", 1, 1, 1)
  database.LoadDBVar(database.DBVAR_DW, "DCO_MpFC_SCC_AcceptedSources", 7, 1, 1)
  database.LoadDBVar(database.DBVAR_DW, "DCO_MpFC_SCC_SupportedSettings", 7, 1, 1)
  return
end
local l_0_1 = versioning.GetPlatformRing()
if l_0_1 >= versioning.PLATFORM_RING_0_INTERNAL and l_0_1 <= versioning.PLATFORM_RING_3_STAGED then
  database.LoadDBVar(database.DBVAR_DW, "DCO_MpFC_SCC_EnableEarlyInit", 1, 1, 1)
end
if l_0_1 == versioning.PLATFORM_RING_4_BROAD and versioning.IsSampled(10000, false, false, true) then
  database.LoadDBVar(database.DBVAR_DW, "DCO_MpFC_SCC_EnableEarlyInit", 1, 1, 1)
end
if versioning.GetOsVersion() > 393216 and versioning.GetOsVersion() < 393219 then
  database.LoadDBVar(database.DBVAR_DW, "DCO_MpFC_SCC_FeatureAvailable", 1, 1, 1)
  return
end
database.LoadDBVar(database.DBVAR_DW, "DCO_MpFC_SCC_FeatureAvailable", 1, 1, 1)
database.LoadDBVar(database.DBVAR_DW, "DCO_MpFC_SCC_SupportedSettings", 3, 1, 1)
if versioning.GetPlatformBuild() >= 1707871164 then
  database.LoadDBVar(database.DBVAR_DW, "DCO_MpFC_SCC_AcceptedSources", 7, 1, 1)
else
  database.LoadDBVar(database.DBVAR_DW, "DCO_MpFC_SCC_AcceptedSources", 3, 1, 1)
end
