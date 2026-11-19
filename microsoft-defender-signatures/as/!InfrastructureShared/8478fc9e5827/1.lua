-- Threat: !InfrastructureShared
-- Name: 8478fc9e5827
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true and mp.get_mpattribute("Lua:Win32/FileExports.A!boo") and mp.get_mpattribute("LUA:FileSizeLE10000.A") then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
end
return mp.INFECTED
