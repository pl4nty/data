-- Threat: !InfrastructureShared
-- Name: bbb3e2943179
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
elseif this_sigattrlog[5].matched then
  l_0_1 = this_sigattrlog[5].ppid
else
  return mp.CLEAN
end
local l_0_2
if this_sigattrlog[6].matched then
  l_0_2 = this_sigattrlog[6].ppid
else
  return mp.CLEAN
end
for l_0_3 = 1, 5 do
  if 6 < l_0_3 then
    return mp.CLEAN
  end
  local l_0_4, l_0_5 = bm.get_process_relationships(l_0_1)
  for l_0_6, l_0_7 in ipairs(l_0_5) do
    if l_0_7.reason == 1 then
      local l_0_8 = string.lower(string.match(l_0_7.image_path, "\\([^\\]+)$"))
      if l_0_7.ppid == l_0_2 then
        return mp.INFECTED
      elseif l_0_0[l_0_8] ~= true then
        mp.ReportLowfi(l_0_7.image_path, 187850996)
        return mp.CLEAN
      end
      l_0_1 = l_0_7.ppid
    end
  end
end
return mp.CLEAN
