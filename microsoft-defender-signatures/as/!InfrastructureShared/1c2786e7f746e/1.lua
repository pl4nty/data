-- Threat: !InfrastructureShared
-- Name: 1c2786e7f746e
-- Type: 21
-- Flags: 1

if mp.get_mpattribute("SIGATTR:GoogleSoftwareRemovalTool") == true then
  return mp.CLEAN
end
local l_0_0 = mp.GetCertificateInfo()
if l_0_0 ~= nil and 0 < #l_0_0 then
  for l_0_1, l_0_2 in ipairs(l_0_0) do
    if l_0_2.AuthenticodeContentType == "PE" then
      local l_0_3 = l_0_2.Certificates
      if l_0_3 ~= nil then
        for l_0_4, l_0_5 in ipairs(l_0_3) do
          local l_0_6 = l_0_5.Subject
          if l_0_6 ~= nil and l_0_6.Organization ~= nil and mp.utf16to8(l_0_6.Organization) == "Google Inc" then
            return mp.CLEAN
          end
        end
      end
    end
  end
end
if mp.HSTR_WEIGHT >= 3 then
  return mp.INFECTED
end
return mp.LOWFI
