-- Threat: !InfrastructureShared
-- Name: 55b399de8138
-- Type: 21

for l_0_0 = 1, mp.SIGATTR_LOG_SZ do
  if sigattr_tail[l_0_0].matched and sigattr_tail[l_0_0].attribute == 16384 then
    local l_0_1 = string.lower(mp.utf16to8(sigattr_tail[l_0_0].wp1))
    if string.find(l_0_1, "\\temp\\%a%a%a%a%a%a%a%a.exe") then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
