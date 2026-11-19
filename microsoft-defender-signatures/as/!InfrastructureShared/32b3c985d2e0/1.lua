-- Threat: !InfrastructureShared
-- Name: 32b3c985d2e0
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].ppid ~= nil and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
  if string.sub(l_0_0, -12, -1) ~= "werfault.exe" then
    return mp.CLEAN
  end
  local l_0_1 = this_sigattrlog[1].ppid
  local l_0_2, l_0_3, l_0_4 = pcall(bm.get_process_relationships)
  if l_0_2 then
    for l_0_5, l_0_6 in ipairs(l_0_3) do
      if l_0_6.image_path ~= nil and (string.find(string.lower(l_0_6.image_path), "\\syswow64\\regsvr32.exe", 1, true) or string.find(string.lower(l_0_6.image_path), "\\syswow64\\rundll32.exe", 1, true)) and l_0_1 ~= nil then
        bm.request_SMS(l_0_1, "m")
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
