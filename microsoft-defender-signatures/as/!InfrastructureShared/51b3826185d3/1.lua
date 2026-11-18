-- Threat: !InfrastructureShared
-- Name: 51b3826185d3
-- Type: 21

if not (this_sigattrlog[1].matched and this_sigattrlog[1].ppid) or not this_sigattrlog[2].matched then
  return mp.CLEAN
end
local l_0_0, l_0_1 = bm.get_process_relationships(this_sigattrlog[1].ppid)
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if l_0_3.image_path and string.find(l_0_3.image_path, "svchost.exe", 1, true) then
    local l_0_4 = this_sigattrlog[2].utf8p1
    if l_0_4 and not mp.IsKnownFriendlyFile(l_0_4, false, false) then
      mp.ReportLowfi(l_0_4, 3377723068)
      return mp.CLEAN
    end
  end
end
return mp.CLEAN
