-- Threat: !InfrastructureShared
-- Name: Gamarue
-- Type: 14

local l_0_0 = sysio.RegExpandUserKey("HKCU\\Software")
if l_0_0 then
  for l_0_1, l_0_2 in pairs(l_0_0) do
    local l_0_3 = sysio.RegOpenKey(l_0_2)
    if l_0_3 then
      sysio.DeleteRegValue(l_0_3, "DOS_STUB")
      sysio.DeleteRegValue(l_0_3, "IMAGE_FILE_HEADER")
      sysio.DeleteRegValue(l_0_3, "ImageBase")
    end
  end
end
