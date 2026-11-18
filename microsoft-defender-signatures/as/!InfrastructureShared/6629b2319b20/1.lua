-- Threat: !InfrastructureShared
-- Name: 6629b2319b20
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:[CMDEmbedded]") then
  local r0_0 = mp.GetBruteMatchData()
  if r0_0.match_offset ~= 0 then
    return mp.CLEAN
  end
  if r0_0.is_header then
    local r0_1 = mp.getfilesize()
    local r0_2 = 256
    if r0_1 < r0_2 then
      r0_2 = r0_1
    end
    mp.readprotection(false)
    local r0_3 = mp.readfile(r0_0.match_offset, r0_2):lower()
    local r0_4 = r0_3:match('%.%.\\%.%.\\%.%.\\%.%.\\%.%.\\%l+\\%w+%.exe%s"(%w:\\users\\[^\\]+\\appdata\\roaming\\%l+\\%l+%.js)"')
    if r0_4 ~= nil then
      mp.ReportLowfi(r0_4, 2148319275)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
