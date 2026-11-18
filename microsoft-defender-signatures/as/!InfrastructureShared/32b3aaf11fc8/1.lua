-- Threat: !InfrastructureShared
-- Name: 32b3aaf11fc8
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0 = "hmdprecisionpulse"
  local l_0_1 = "hmdprecisionpulsefullfilepathscan"
  local l_0_2, l_0_3 = pcall(MpCommon.RollingQueueQueryKVNamespaced, l_0_1, l_0_0)
  local l_0_4 = {}
  if l_0_2 and l_0_3 then
    for l_0_5, l_0_6 in pairs(l_0_3) do
      table.insert(l_0_4, l_0_5)
      bm.add_related_file(l_0_5)
    end
  end
  bm.add_related_string("FileList", table.concat(l_0_4, "|"), bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN
