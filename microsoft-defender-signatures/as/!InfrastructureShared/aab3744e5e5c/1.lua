-- Threat: !InfrastructureShared
-- Name: aab3744e5e5c
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = 0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_2 = {}
  for l_0_3 = 1, l_0_0 do
    if sigattr_tail[l_0_3].attribute == 16387 then
      l_0_2[sigattr_tail[l_0_3].utf8p1:lower()] = l_0_3
      l_0_1 = l_0_1 + 1
    end
  end
  if 5 <= l_0_1 then
    local l_0_4 = {}
    local l_0_5 = safeJsonDeserialize(this_sigattrlog[1].utf8p2)
    local l_0_6 = string.len(l_0_5.appended_ext)
    for l_0_7, l_0_8 in ipairs(l_0_5.file_list) do
      local l_0_9 = string.len(l_0_8.path)
      if l_0_6 < l_0_9 then
        local l_0_10 = string.sub(l_0_8.path, 1, l_0_9 - l_0_6)
        if l_0_2[l_0_10] ~= nil then
          table.insert(l_0_4, l_0_8.path)
        end
        if 4 <= #l_0_4 then
          local l_0_11 = {
            appended_ext = l_0_5.appended_ext,
            encrypted_file_meta = l_0_4
          }
          bm.trigger_sig("GenericRansomware:Type4.2", safeJsonSerialize(l_0_11))
          bm.add_related_string("genda_delete_ransom_meta", safeJsonSerialize(l_0_11), bm.RelatedStringBMReport)
          return mp.INFECTED
        end
      end
    end
  end
end
return mp.CLEAN
