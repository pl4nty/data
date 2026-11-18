-- Threat: \xac!Gracing.A
-- Type: 11
-- Includes: LuaFuncHelper, BMLuaLib
-- MpAttributes: (RPF:GoLang:pclntab_magic_unknown & (!pea_amd64_image))

local l_0_0 = mp.get_mpattributevalue("RPF:GoLang:pclntab_magic_unknown")
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = {
  4294967280,
  4294967291,
  4294967290,
  4294967281
}
local l_0_2 = false
for l_0_3, l_0_4 in ipairs(l_0_1) do
  if mp.bitand(l_0_0, l_0_4) ~= l_0_4 then
    l_0_2 = true
    break
  end
end
if l_0_2 then
  local l_0_5 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
  if isnull(l_0_5) then
    return mp.CLEAN
  end
  local l_0_6 = mp.GetProcessCommandLine(l_0_5)
  if isnull(l_0_6) then
    return mp.CLEAN
  end
  
  local function l_0_7(l_1_0)
    local l_1_1 = {}
    for l_1_2 in string.gmatch(l_1_0, "http[s]?://[^\"%s]+") do
      table.insert(l_1_1, l_1_2)
    end
    return l_1_1
  end
  
  local l_0_8 = l_0_7(l_0_6)
  l_0_8 = table_dedup(l_0_8)
  local l_0_9 = {}
  l_0_9.SIG_CONTEXT = "GoLang"
  l_0_9.CONTENT_SOURCE = "GOLANG_32_WITH_TEMPERED_PCLNTAB_MAGIC"
  for l_0_10, l_0_11 in ipairs(l_0_8) do
    if string.match(l_0_11, "^https?://") then
      local l_0_12, l_0_13 = mp.CheckUrl(l_0_11)
      if l_0_12 == 1 and l_0_13 == 1 then
        return mp.CLEAN
      end
      local l_0_14 = SafeGetUrlReputation({l_0_11}, l_0_9, false, 3000)
      if l_0_14.urls[l_0_11] and l_0_14.urls[l_0_11].determination ~= 1 and l_0_14.urls[l_0_11].confidence ~= 90 then
        if mp.IsTrustedFile(false) == true then
          return mp.CLEAN
        end
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
