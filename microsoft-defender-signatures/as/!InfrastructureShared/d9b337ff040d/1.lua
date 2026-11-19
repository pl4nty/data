-- Threat: !InfrastructureShared
-- Name: d9b337ff040d
-- Type: 21

local l_0_0
if this_sigattrlog[4].matched then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p2)
elseif this_sigattrlog[5].matched then
  l_0_0 = string.lower(this_sigattrlog[5].utf8p2)
elseif this_sigattrlog[6].matched then
  l_0_0 = string.lower(this_sigattrlog[6].utf8p2)
end
if l_0_0 ~= nil and this_sigattrlog[7].matched and string.len(l_0_0) > 3 then
  if string.find(l_0_0, ".part", 1, true) or string.find(l_0_0, "/wiki/pages/", 1, true) or string.find(l_0_0, "/ee-help/help-pdfs/", 1, true) or string.find(l_0_0, "downloadcoursiercli", 1, true) or string.find(l_0_0, "/softwarepackages/", 1, true) or string.find(l_0_0, "\\motorola\\", 1, true) or string.find(l_0_0, "\\positron\\", 1, true) or string.find(l_0_0, "\\bat4download\\", 1, true) then
    return mp.CLEAN
  end
  local l_0_1 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[7].utf8p1)
  local l_0_2 = mp.GetMotwHostUrlForFile(l_0_1)
  if l_0_2 then
    if string.find(l_0_2, "download.windowsupdate.com", 1, true) or string.find(l_0_2, "jquery.com", 1, true) or string.find(l_0_2, "scm.dndev.net", 1, true) or string.find(l_0_2, "mozilla.org", 1, true) or string.find(l_0_2, "trendmicro.com", 1, true) or string.find(l_0_2, "sharepoint.com", 1, true) or string.find(l_0_2, "repo.anaconda.com/miniconda", 1, true) or string.find(l_0_2, "openstreetmap.ru", 1, true) or string.find(l_0_2, "honda.co.jp", 1, true) or string.find(l_0_2, "google.com", 1, true) or string.find(l_0_2, "google.com", 1, true) or string.find(l_0_2, ".zscaler.", 1, true) or string.find(l_0_2, "www.att.com", 1, true) or string.find(l_0_2, "microsoft.com", 1, true) or string.find(l_0_1, "aka.ms", 1, true) or string.find(l_0_2, "fortinet.com", 1, true) or string.find(l_0_2, "core.windows.net", 1, true) then
      return mp.CLEAN
    end
    local l_0_3 = {
      [".msu"] = true,
      [".msi"] = true,
      [".xml"] = true,
      [".cab"] = true,
      [".txt"] = true,
      [".mp4"] = true,
      [".gitignore"] = true,
      [".war"] = true,
      [".ts"] = true,
      [".zip"] = true,
      [".bz2"] = true,
      [".vdf"] = true,
      [".part"] = true,
      [".7z"] = true,
      [".html"] = true,
      [".ps1"] = true,
      [".gif"] = true,
      [".drift"] = true,
      [".ini"] = true,
      [".csv"] = true,
      [".mp3"] = true,
      [".sql"] = true
    }
    local l_0_4 = string.sub(l_0_1, -4)
    local l_0_5 = string.sub(l_0_1, -5)
    local l_0_6 = string.sub(l_0_1, -10)
    local l_0_7 = string.sub(l_0_1, -3)
    if l_0_3[l_0_4] or l_0_3[l_0_5] or l_0_3[l_0_6] or l_0_3[l_0_7] then
      return mp.CLEAN
    end
    bm.add_related_string("bmurl", l_0_2, bm.RelatedStringBMReport)
    return mp.INFECTED
  end
end
return mp.CLEAN
