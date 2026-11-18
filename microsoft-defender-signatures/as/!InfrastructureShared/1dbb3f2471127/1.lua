-- Threat: !InfrastructureShared
-- Name: 1dbb3f2471127
-- Type: 21

local l_0_0 = {
  ["cmd.exe"] = true,
  ["powershell.exe"] = true
}
local l_0_1 = {
  ["cscript.exe"] = true,
  ["wscript.exe"] = true
}
local l_0_2 = {
  ["python.exe"] = true,
  ["perl.exe"] = true,
  ["java.exe"] = true
}
local l_0_3
if this_sigattrlog[1].matched then
  l_0_3 = this_sigattrlog[1].ppid
elseif this_sigattrlog[2].matched then
  l_0_3 = this_sigattrlog[2].ppid
elseif this_sigattrlog[3].matched then
  l_0_3 = this_sigattrlog[3].ppid
elseif this_sigattrlog[4].matched then
  l_0_3 = this_sigattrlog[4].ppid
elseif this_sigattrlog[5].matched then
  l_0_3 = this_sigattrlog[5].ppid
else
  return mp.CLEAN
end
local l_0_4
local l_0_5 = false
if this_sigattrlog[6].matched then
  local l_0_6 = string.lower(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[6].utf8p2))
  if string.find(l_0_6, "/query", 1, true) == nil and string.find(l_0_6, "/delete", 1, true) == nil then
    l_0_5 = true
  end
  l_0_4 = this_sigattrlog[6].ppid
elseif this_sigattrlog[7].matched then
  l_0_5 = true
  l_0_4 = this_sigattrlog[7].ppid
else
  return mp.CLEAN
end
for l_0_7 = 1, 6 do
  if 7 < l_0_7 then
    return mp.CLEAN
  end
  local l_0_8, l_0_9 = bm.get_process_relationships(l_0_3)
  for l_0_10, l_0_11 in ipairs(l_0_9) do
    if l_0_11.image_path ~= nil and l_0_11.reason == 1 then
      if l_0_11.ppid == l_0_4 then
        return mp.CLEAN
      end
      local l_0_12 = string.lower(string.match(l_0_11.image_path, "\\([^\\]+)$"))
      if l_0_0[l_0_12] == true or l_0_1[l_0_12] == true or l_0_2[l_0_12] == true then
        if l_0_5 == true then
          return mp.INFECTED
        else
          mp.ReportLowfi(l_0_11.image_path, 1694283818)
        end
      end
      bm.add_related_file(l_0_11.image_path)
      l_0_3 = l_0_11.ppid
    end
  end
end
return mp.CLEAN
