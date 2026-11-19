-- Threat: !InfrastructureShared
-- Name: 6178544347dc
-- Type: 21

if peattributes.isdll == true then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
end
local l_0_3, l_0_4 = pe.get_exports()
if 0 < l_0_3 and l_0_3 < 2 then
  for l_0_5 = 1, l_0_3 do
    local l_0_6 = pe.mmap_string_rva(l_0_4[l_0_5].namerva, 64)
    if l_0_6 == "vkEnumerateInstanceVersion" then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
