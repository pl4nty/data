-- Threat: !InfrastructureShared
-- Name: 8db3868291a1
-- Type: 21

function string_starts(l_1_0, l_1_1)
  return string.sub(l_1_0, 1, string.len(l_1_1)) == l_1_1
end

if this_sigattrlog[2].matched and this_sigattrlog[2].wp1 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
  l_0_0 = string.match(l_0_0, "\\run\\\\(.+)$")
  local l_0_1 = {
    "media",
    "video",
    "tray",
    "desktop",
    "icon",
    "folder",
    "database",
    "connection",
    "crashreport",
    "time",
    "network"
  }
  local l_0_2 = {
    "updater",
    "checker",
    "notifyer",
    "saver",
    "verifyer",
    "informer"
  }
  local l_0_3 = #l_0_1
  local l_0_4 = #l_0_2
  for l_0_5 = 1, l_0_3 do
    if string_starts(l_0_0, l_0_1[l_0_5]) then
      for l_0_6 = 1, l_0_4 do
        if string_starts(string.sub(l_0_0, string.len(l_0_1[l_0_5]) + 1), l_0_2[l_0_6]) then
          return mp.INFECTED
        end
      end
    end
  end
end
mp.ReportLowfi(this_sigattrlog[2].utf8p2, 3515746503)
return mp.CLEAN
