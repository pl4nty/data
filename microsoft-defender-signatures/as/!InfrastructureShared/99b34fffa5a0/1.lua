-- Threat: !InfrastructureShared
-- Name: 99b34fffa5a0
-- Type: 21

local l_0_0 = {
  ["cmd.exe"] = true,
  ["powershell.exe"] = true
}
local l_0_1
if this_sigattrlog[1].matched then
  l_0_1 = this_sigattrlog[1].ppid
elseif this_sigattrlog[2].matched then
  l_0_1 = this_sigattrlog[2].ppid
elseif this_sigattrlog[3].matched then
  l_0_1 = this_sigattrlog[3].ppid
elseif this_sigattrlog[4].matched then
  l_0_1 = this_sigattrlog[4].ppid
  local l_0_2 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[4].utf8p2)
  if l_0_2 == nil or l_0_2 == "" then
    return mp.CLEAN
  end
  if string.find(string.lower(l_0_2), "dng-proxy-o.denso.co.jp:8080", 1, true) ~= nil then
    return mp.CLEAN
  end
else
  return mp.CLEAN
end
local l_0_3
if this_sigattrlog[5].matched then
  l_0_3 = this_sigattrlog[5].ppid
  local l_0_4 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[5].utf8p2)
  if l_0_4 == nil or l_0_4 == "" then
    return mp.CLEAN
  end
  if string.find(string.lower(l_0_4), "dng-proxy-o.denso.co.jp:8080", 1, true) ~= nil then
    return mp.CLEAN
  end
else
  return mp.CLEAN
end
for l_0_5 = 1, 5 do
  if 6 < l_0_5 then
    return mp.CLEAN
  end
  local l_0_6, l_0_7 = bm.get_process_relationships(l_0_1)
  for l_0_8, l_0_9 in ipairs(l_0_7) do
    if l_0_9.reason == 1 then
      local l_0_10 = string.lower(string.match(l_0_9.image_path, "\\([^\\]+)$"))
      if l_0_9.ppid == l_0_3 then
        return mp.INFECTED
      elseif l_0_0[l_0_10] ~= true then
        mp.ReportLowfi(l_0_9.image_path, 4150180286)
        return mp.CLEAN
      end
      l_0_1 = l_0_9.ppid
    end
  end
end
return mp.CLEAN
