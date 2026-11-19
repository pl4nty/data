-- Threat: !InfrastructureShared
-- Name: !#Lua:ThirdPartyCertListSubstring.A
-- Type: 9
-- MpAttributes: RPF:TopLevelFile & LUA:FileSizeGT20000.A & PEPCODE:HasDigitalSignature

local l_0_0 = mp.GetCertificateInfo()
if l_0_0 == nil or type(l_0_0) ~= "table" or #l_0_0 == 0 then
  return mp.CLEAN
end
local l_0_1 = {mcafee = "mcafee"}
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if l_0_3.AuthenticodeContentType == nil or l_0_3.AuthenticodeContentType ~= "PE" then
    return mp.CLEAN
  end
  local l_0_4 = l_0_3.Certificates
  if l_0_4 ~= nil and type(l_0_4) == "table" then
    for l_0_5, l_0_6 in pairs(l_0_3.Certificates) do
      local l_0_7 = l_0_6.Subject
      if l_0_7 ~= nil and type(l_0_6) == "table" then
        local l_0_8 = l_0_7.Organization
        if l_0_8 ~= nil and type(l_0_8) == "string" then
          local l_0_9 = string.lower(mp.utf16to8(l_0_8))
          for l_0_10, l_0_11 in pairs(l_0_1) do
            if string.find(l_0_9, l_0_10, 1, true) ~= nil then
              local l_0_12 = "Lua:ThirdPartyCertListSubstring.A!" .. l_0_11
              mp.set_mpattribute(l_0_12)
              return mp.INFECTED
            end
          end
        end
      end
    end
  end
end
return mp.CLEAN
