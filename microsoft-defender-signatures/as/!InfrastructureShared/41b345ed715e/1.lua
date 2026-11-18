-- Threat: !InfrastructureShared
-- Name: 41b345ed715e
-- Type: 21

if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[3].utf8p2)
  local l_0_1, l_0_2 = bm.get_process_relationships()
  for l_0_3, l_0_4 in ipairs(l_0_1) do
    local l_0_5 = string.lower(MpCommon.PathToWin32Path(l_0_4.image_path))
    local l_0_6 = MpCommon.QueryPersistContext(l_0_5, "PsExecServiceStandardName")
    if l_0_6 then
      mp.ReportLowfi(l_0_0, 2705434468)
      bm.add_related_file(l_0_0)
      return mp.INFECTED
    end
    local l_0_7 = MpCommon.QueryPersistContext(l_0_5, "PsExecServiceNonStandardName")
    if l_0_7 then
      mp.ReportLowfi(l_0_0, 2705434468)
      bm.add_related_file(l_0_0)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
