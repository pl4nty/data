-- Threat: !InfrastructureShared
-- Name: 25fb3c34fbc82
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker, LuaFuncHelper

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
if isParentPackageManager(l_0_0.ppid, true) then
  return mp.CLEAN
end
local l_0_1
if this_sigattrlog[15].matched and this_sigattrlog[15].utf8p1 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[15].utf8p1)
end
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = false
local l_0_3 = string.match(l_0_1, "^/usr/local/")
if l_0_3 == nil or l_0_3 == "" then
  if isTainted(l_0_1, "upx_file_created_taint") then
    bm.trigger_sig("BM_ELFUPX", l_0_1)
    l_0_2 = true
  end
  if isTainted(l_0_1, "masqueraded_file_extension_taint") then
    bm.trigger_sig("BM_MasqueradedFileExtension", l_0_1)
    l_0_2 = true
  end
  if isTainted(l_0_1, "stripped_elf_created_taint") then
    bm.trigger_sig("BM_ELFStrippedTrigger", l_0_1)
    l_0_2 = true
  end
  if isTainted(l_0_1, "new_elf_file_created_hint") then
    bm.trigger_sig("BM_NewElfCreated", l_0_1)
    l_0_2 = true
  end
end
if IsKeyInRollingQueue("enum_hstr_attributes", l_0_1, true) then
  local l_0_4 = GetRollingQueueAsHashTable("enum_hstr_attributes")
  if l_0_4 == nil then
    return mp.CLEAN
  end
  local l_0_5 = StringSplit(l_0_4[l_0_1], "|")
  if l_0_5 ~= nil or 0 < #l_0_5 then
    for l_0_6 = 1, #l_0_5 do
      local l_0_7 = "BM_ContentAttribs:" .. l_0_5[l_0_6]
      bm.trigger_sig(l_0_7, l_0_1)
    end
    l_0_2 = true
  end
end
if IsKeyInRollingQueue("enum_bm_attributes", l_0_1, true) then
  local l_0_8 = GetRollingQueueAsHashTable("enum_bm_attributes")
  if l_0_8 == nil then
    return mp.CLEAN
  end
  local l_0_9 = StringSplit(l_0_8[l_0_1], "|")
  if l_0_9 ~= nil or 0 < #l_0_9 then
    for l_0_10 = 1, #l_0_9 do
      local l_0_11 = "BM_ContentAttribs:" .. l_0_9[l_0_10]
      bm.trigger_sig(l_0_11, l_0_1)
    end
    l_0_2 = true
  end
end
if l_0_2 == false then
  return mp.CLEAN
end
return mp.INFECTED
