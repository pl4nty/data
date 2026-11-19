-- Threat: !InfrastructureShared
-- Name: 117b33e216a0c
-- Type: 21

local l_0_0, l_0_1
local l_0_2 = bm.get_current_process_startup_info()
if l_0_2.integrity_level > MpCommon.SECURITY_MANDATORY_MEDIUM_RID then
  return mp.CLEAN
end
local l_0_3 = MpCommon.GetProcessElevationAndIntegrityLevel(l_0_2.ppid)
if l_0_3.IntegrityLevel > MpCommon.SECURITY_MANDATORY_MEDIUM_RID then
  return mp.CLEAN
end
if this_sigattrlog[1].matched then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
  l_0_1 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
  l_0_1 = this_sigattrlog[2].utf8p2
else
  return mp.CLEAN
end
local l_0_4 = {
  "c343ed84-a129-11d3-b799-0060b0f159ef",
  "5d09dd40-cdc4-4c56-b615-0d1e3b357c2b",
  "e81fb43c-b144-4d30-8033-c9338aa0ecb8",
  "c442ac41-9200-4770-8cc0-7cdb4f245c55",
  "00024512-0000-0000-c000-000000000046",
  "08d512d2-7d97-4e22-b7db-82791106c086",
  "83b0e426-d4ee-11d4-bedf-bab7f1eea455",
  "2d0e74b6-021a-11d5-9054-00508bf70a94",
  "9dc963f3-00ec-4bb0-a344-2d6cc1da19ab",
  "f90026a8-a02e-4f1c-a0c6-76955a119600",
  "c4f0910e-e0b4-4e68-8086-452730c7a26a",
  "6a481801-e531-11cf-a115-00a024158daf",
  "cd2425e4-8141-11d0-8ce4-444553540000",
  "fb2fe984-05f5-4512-9d9b-69d3de61f6d9",
  "c3101a8b-0ee1-4612-bfe9-41ffc1a3c19d",
  "99e2b362-3e4e-4255-9b29-41a7f40777ba",
  "32e26fd9-f435-4a20-a561-35d4b987cfdc",
  "017ce1a6-416f-4684-ae6a-02064420b30a"
}
for l_0_5, l_0_6 in pairs(l_0_4) do
  if string.find(l_0_0, l_0_6, 1, true) then
    return mp.CLEAN
  end
end
local l_0_7 = string.match(l_0_0, "inprocserver32.*")
if l_0_7 ~= nil and string.len(l_0_7) > 15 then
  return mp.CLEAN
end
local l_0_8 = mp.ContextualExpandEnvironmentVariables(l_0_1)
if l_0_8 then
  l_0_1 = string.lower(l_0_8)
end
if sysio.IsFileExists(l_0_1) then
  if string.find(l_0_1, ":\\program files\\", 1, true) or string.find(l_0_1, ":\\program files (x86)\\", 1, true) or string.find(l_0_1, ":\\windows\\", 1, true) or string.find(l_0_1, "\\root\\office15\\interceptor.dll", -30, true) or string.find(l_0_1, "\\microsoft shared\\office15\\msoxev.dll", -37, true) or string.find(l_0_1, "\\appdata\\roaming\\microsoft\\mslang\\xml32.dll", -43, true) or string.find(l_0_1, "\\appdata\\local\\microsoft\\onedrive\\", 1, true) or string.find(l_0_1, "\\appdata\\local\\kingsoft\\wps office\\", 1, true) or string.find(l_0_1, "\\appdata\\local\\chromium\\update\\", 1, true) or mp.IsKnownFriendlyFile(l_0_1, true, false) == true then
    return mp.CLEAN
  end
  local l_0_9 = string.match(l_0_1, "(v8_[a-f0-9]*_[a-f0-9]*%.tmp)$")
  if l_0_9 ~= nil and string.len(l_0_9) <= 16 then
    return mp.CLEAN
  end
  local l_0_10 = sysio.GetFileLastWriteTime(l_0_1)
  if sysio.GetLastResult().Success and l_0_10 ~= 0 then
    l_0_10 = l_0_10 / 10000000 - 11644473600
    local l_0_11 = MpCommon.GetCurrentTimeT()
    if l_0_10 > l_0_11 or 600 < l_0_11 - l_0_10 then
      return mp.CLEAN
    end
  end
  if l_0_0 ~= nil and string.len(l_0_0) > 24 then
    local l_0_12
    l_0_0 = l_0_0:gsub("hkcu", "hklm")
    l_0_12 = sysio.RegOpenKey(l_0_0)
    if l_0_12 ~= nil then
      local l_0_13 = sysio.GetRegValueAsString(l_0_12, "")
      l_0_13 = string.lower(mp.ContextualExpandEnvironmentVariables(l_0_13))
      if l_0_13 ~= nil and string.len(l_0_13) > 0 and l_0_13 ~= l_0_1 then
        local l_0_14 = 1
        local l_0_15
        local l_0_16 = 0
        local l_0_17 = 0
        local l_0_18 = 0
        local l_0_19, l_0_20
        while l_0_16 < 8 do
          l_0_19, l_0_20 = string.find(l_0_13, "\\", l_0_14, true)
          if l_0_19 == nil then
            break
          end
          l_0_15 = string.sub(l_0_13, l_0_14, l_0_19)
          local l_0_21, l_0_22 = string.find(l_0_1, "\\", l_0_14, true)
          if l_0_21 == l_0_19 and string.find(l_0_1, l_0_15, l_0_14, true) then
            l_0_17 = l_0_17 + 1
          end
          l_0_14 = l_0_20 + 1
          l_0_18 = l_0_18 + 1
        end
        if l_0_17 < 2 and 2 < l_0_18 then
          bm.add_related_file(l_0_1)
          bm.add_threat_file(l_0_1)
          mp.ReportLowfi(l_0_1, 1827652614)
          return mp.INFECTED
        end
      end
    end
  end
end
return mp.CLEAN
