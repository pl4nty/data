-- Threat: !InfrastructureShared
-- Name: 140b33cc3933a
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4
if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[6].utf8p2:lower()
  l_0_3 = this_sigattrlog[6].ppid
elseif this_sigattrlog[7].matched and this_sigattrlog[7].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[7].utf8p2:lower()
  l_0_3 = this_sigattrlog[7].ppid
end
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_1 = string.match(this_sigattrlog[4].utf8p1, "\\([^\\]+)$")
end
if not contains(l_0_0, l_0_1) then
  return mp.CLEAN
end
if not l_0_0 then
  return mp.CLEAN
end
local l_0_5 = false
local l_0_6 = mp.GetParentProcInfo(l_0_3)
if l_0_6 ~= nil then
  l_0_4 = string.lower(l_0_6.image_path)
end
if not l_0_4 then
  return mp.CLEAN
end
local l_0_7 = {
  "certutil.exe",
  "mshta.exe"
}
if contains(l_0_4, l_0_7) then
  l_0_5 = true
end
local l_0_8 = {
  "winword.exe",
  "excel.exe",
  "powerpnt.exe"
}
if contains(l_0_4, l_0_8) then
  l_0_5 = true
end
l_0_2 = extractDllForRegproc(l_0_0)
if l_0_2 then
  l_0_2 = mp.ContextualExpandEnvironmentVariables(l_0_2)
  if sysio.IsFileExists(l_0_2) then
    local l_0_9 = sysio.GetFileLastWriteTime(l_0_2)
    if sysio.GetLastResult().Success and l_0_9 ~= 0 then
      l_0_9 = l_0_9 / 10000000 - 11644473600
      local l_0_10 = MpCommon.GetCurrentTimeT()
      if l_0_9 > l_0_10 or 3600 < l_0_10 - l_0_9 and l_0_5 == true then
        bm.add_related_file(l_0_2)
      else
        return mp.CLEAN
      end
    end
  end
end
if l_0_5 then
  return mp.INFECTED
end
return mp.CLEAN
