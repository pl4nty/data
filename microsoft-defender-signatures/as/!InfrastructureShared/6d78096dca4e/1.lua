-- Threat: !InfrastructureShared
-- Name: 6d78096dca4e
-- Type: 21

if peattributes.isdll and peattributes.hasexports and peattributes.amd64_image then
  if mp.getfilesize() > 1703936 then
    return mp.CLEAN
  end
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  local l_0_3 = pe.get_exports_count()
  if 2 <= l_0_3 and l_0_3 <= 10 then
    local l_0_4, l_0_5 = pe.get_exports()
    local l_0_6 = 0
    local l_0_7 = 0
    for l_0_8 = 1, l_0_4 do
      local l_0_9 = l_0_5[l_0_8].rva
      if l_0_9 <= 12288 then
        l_0_6 = 1
      elseif 131072 <= l_0_9 then
        l_0_7 = 1
      end
    end
    if l_0_6 == 1 and l_0_7 == 1 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
