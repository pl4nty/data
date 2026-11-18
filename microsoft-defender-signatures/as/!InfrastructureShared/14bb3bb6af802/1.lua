-- Threat: !InfrastructureShared
-- Name: 14bb3bb6af802
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
else
  return mp.CLEAN
end
local l_0_4
local l_0_5 = false
if this_sigattrlog[2].matched then
  local l_0_6 = string.lower(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[2].utf8p2))
  if string.find(l_0_6, "/query", 1, true) == nil and string.find(l_0_6, "/delete", 1, true) == nil then
    l_0_5 = true
  end
  l_0_4 = this_sigattrlog[2].ppid
elseif this_sigattrlog[3].matched then
  l_0_5 = true
  l_0_4 = this_sigattrlog[3].ppid
elseif this_sigattrlog[4].matched then
  l_0_4 = this_sigattrlog[4].ppid
elseif this_sigattrlog[5].matched then
  l_0_4 = this_sigattrlog[5].ppid
elseif this_sigattrlog[6].matched then
  l_0_4 = this_sigattrlog[6].ppid
elseif this_sigattrlog[7].matched then
  l_0_4 = this_sigattrlog[7].ppid
elseif this_sigattrlog[8].matched then
  l_0_4 = this_sigattrlog[8].ppid
elseif this_sigattrlog[9].matched then
  l_0_4 = this_sigattrlog[9].ppid
elseif this_sigattrlog[10].matched then
  l_0_4 = this_sigattrlog[10].ppid
elseif this_sigattrlog[11].matched then
  l_0_4 = this_sigattrlog[11].ppid
elseif this_sigattrlog[12].matched then
  l_0_4 = this_sigattrlog[12].ppid
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
        local l_0_13 = string.lower(mp.GetProcessCommandLine(l_0_11.ppid))
        if l_0_13 == nil or l_0_13 == "" or string.find(l_0_13, "\\windows\\ccm\\systemtemp\\", 1, true) == nil and string.find(l_0_13, "\\windows\\ccmcache\\", 1, true) == nil then
          if l_0_5 == true then
            return mp.INFECTED
          else
            mp.ReportLowfi(l_0_11.image_path, 864567885)
          end
        end
      end
      bm.add_related_file(l_0_11.image_path)
      l_0_3 = l_0_11.ppid
    end
  end
end
return mp.CLEAN
