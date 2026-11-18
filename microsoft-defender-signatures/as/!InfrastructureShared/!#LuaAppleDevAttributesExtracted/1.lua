-- Threat: !InfrastructureShared
-- Name: !#Lua:AppleDevAttributesExtracted
-- Type: 12
-- MpAttributes: BM_MACOS_CORE_FILE_TYPE

local function l_0_0(l_1_0)
  local l_1_1 = {
    "Apple Development: .+ %((.+)%)$",
    
    "Apple Distribution: .+ %((.+)%)$",
    "Mac Installer Distribution: .+ %((.+)%)$",
    "Developer ID Application: .+ %((.+)%)$",
    "Developer ID Installer: .+ %((.+)%)$"
  }
  for l_1_2, l_1_3 in ipairs(l_1_1) do
    local l_1_4 = string.match(l_1_0, l_1_3)
    if l_1_4 then
      return l_1_4
    end
  end
  return nil
end

local function l_0_1()
  local l_2_0 = mp.GetCertificateInfo()
  if #l_2_0 < 1 or l_2_0 == nil then
    return nil, nil
  end
  local l_2_1, l_2_2
  for l_2_3, l_2_4 in pairs(l_2_0) do
    for l_2_5, l_2_6 in pairs(l_2_4.Certificates) do
      if l_2_6.SubjectUtf8 ~= nil then
        local l_2_7 = l_2_6.SubjectUtf8
        if l_2_7.CommonName ~= nil then
          l_2_2 = l_0_0(l_2_7.CommonName)
        end
        if l_2_2 ~= nil then
          l_2_1 = l_2_7.OrganizationUnit
          return l_2_2, l_2_1
        end
      end
    end
  end
end

local l_0_2 = "Lua:MacOS_X/AppleDeveloperID_"
local l_0_3 = "Lua:MacOS_X/AppleTeamID_"
if mp.get_mpattributesubstring(l_0_2) or mp.get_mpattributesubstring(l_0_3) or mp.get_mpattributesubstring("Lua:AppleDevAttributesExtracted") then
  return mp.CLEAN
end
local l_0_4, l_0_5 = l_0_1()
if l_0_4 == nil and l_0_5 == nil then
  return mp.CLEAN
end
if #l_0_4 == 10 then
  mp.set_mpattribute(l_0_2 .. l_0_4)
end
if #l_0_5 == 10 then
  mp.set_mpattribute(l_0_3 .. l_0_5)
end
return mp.INFECTED
