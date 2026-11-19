-- Threat: !InfrastructureShared
-- Name: 2178b0f70007
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
  if 2 <= l_0_3 and l_0_3 <= 8 then
    local l_0_4, l_0_5 = pe.get_exports()
    for l_0_6 = 1, l_0_4 do
      local l_0_7 = l_0_5[l_0_6].rva
      local l_0_8 = mp.readu_u16(pe.mmap_rva(l_0_7, 2), 1)
      local l_0_9 = mp.bsplit(l_0_8, 8)
      if l_0_9 == 235 or l_0_9 == 233 then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
