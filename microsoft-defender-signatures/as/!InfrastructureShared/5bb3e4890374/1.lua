-- Threat: !InfrastructureShared
-- Name: 5bb3e4890374
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker, LuaFuncHelper

local l_0_0
local l_0_1 = false
local l_0_2 = false
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 then
  l_0_0 = this_sigattrlog[2].utf8p2
  l_0_1 = true
elseif this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 then
  l_0_0 = this_sigattrlog[1].utf8p2
  l_0_2 = true
end
if not l_0_0 then
  return mp.CLEAN
end
local l_0_3 = safeJsonDeserialize(l_0_0)
if not l_0_3 then
  return mp.CLEAN
end
local l_0_4 = l_0_3.appended_ext or nil
if not l_0_4 then
  return mp.CLEAN
end
if l_0_4 == "" then
  return mp.CLEAN
end
if not StringStartsWith(l_0_4, ".") then
  return mp.CLEAN
end
if string.len(l_0_4) < 4 or IsExtensionDatePattern(l_0_4) == true or string.match(l_0_4, "%d+.%d+.%d+") or string.match(l_0_4, "%.%w+%.%w+$") then
  return mp.CLEAN
end
if mp.bitand(mp.GetExtensionClass(l_0_4), 3) ~= 0 then
  return mp.CLEAN
end
local l_0_5 = mp.SIGATTR_LOG_SZ
local l_0_6 = {}
local l_0_7 = {}
for l_0_8 = 1, l_0_5 do
  if l_0_2 then
    if sigattr_tail[l_0_8] and sigattr_tail[l_0_8].attribute == 16385 then
      local l_0_9 = sigattr_tail[l_0_8].utf8p1:lower()
      if StringEndsWith(l_0_9, l_0_4) then
        table.insert(l_0_6, l_0_9)
      end
    end
    if sigattr_head[l_0_8] and sigattr_head[l_0_8].attribute == 16385 then
      local l_0_10 = sigattr_head[l_0_8].utf8p1:lower()
      if StringEndsWith(l_0_10, l_0_4) then
        table.insert(l_0_6, l_0_10)
      end
    end
  end
  if l_0_1 then
    local l_0_11 = sigattr_tail[l_0_8] and sigattr_tail[l_0_8].attribute
    if l_0_11 == 16389 and sigattr_tail[l_0_8].utf8p2 == "ATTR_c09458eb" then
      local l_0_12 = sigattr_tail[l_0_8].utf8p1:lower()
      if StringEndsWith(l_0_12, l_0_4) then
        table.insert(l_0_6, l_0_12)
      end
    end
    local l_0_13 = sigattr_head[l_0_8] and sigattr_head[l_0_8].attribute
    if l_0_13 == 16389 and sigattr_head[l_0_8].utf8p2 == "ATTR_c09458eb" then
      local l_0_14 = sigattr_head[l_0_8].utf8p1:lower()
      if StringEndsWith(l_0_14, l_0_4) then
        table.insert(l_0_6, l_0_14)
      end
    end
  end
  if next(l_0_6) == nil then
    return mp.CLEAN
  end
  l_0_6 = table_dedup(l_0_6)
  if 30 < #l_0_6 then
    for l_0_15, l_0_16 in ipairs(l_0_6) do
      local l_0_17 = l_0_16:match("([^\\]+)$")
      local l_0_18 = l_0_16:match("(.*)\\[^\\]+$")
      if isnull(l_0_17) and isnull(l_0_18) then
        return mp.CLEAN
      end
      table.insert(l_0_7, l_0_18)
    end
    if next(l_0_7) == nil then
      return mp.CLEAN
    end
    l_0_7 = table_dedup(l_0_7)
    if 3 < #l_0_7 then
      bm.add_related_string("encryptedFiles_count", tostring(#l_0_6), bm.RelatedStringBMReport)
      bm.add_related_string("ransom_meta", l_0_0, bm.RelatedStringBMReport)
      local l_0_19 = "RanAggrCount"
      local l_0_20 = 0
      local l_0_21 = bm.get_current_process_startup_info()
      if l_0_21 and l_0_21.ppid then
        l_0_20 = l_0_21.ppid
      end
      if not MpCommon.DoesProcessHaveAttribute(l_0_20, l_0_19) and not MpCommon.DoesProcessHaveAttribute(l_0_20, "inherit:" .. l_0_19) then
        MpCommon.AddProcessAttribute(l_0_20, l_0_19, l_0_0, false)
      end
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
