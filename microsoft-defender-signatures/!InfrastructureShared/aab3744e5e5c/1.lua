-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\aab3744e5e5c\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
  local l_0_2 = {}
  for l_0_6 = 1, l_0_0 do
    if (sigattr_tail[l_0_6]).attribute == 16387 then
      l_0_2[((sigattr_tail[l_0_6]).utf8p1):lower()] = l_0_6
      l_0_1 = l_0_1 + 1
    end
  end
  if l_0_1 >= 5 then
    local l_0_7 = {}
    local l_0_8 = safeJsonDeserialize((this_sigattrlog[1]).utf8p2)
    local l_0_9 = (string.len)(l_0_8.appended_ext)
    for l_0_13,l_0_14 in ipairs(l_0_8.file_list) do
      local l_0_15 = (string.len)(l_0_14.path)
      if l_0_9 < l_0_15 then
        local l_0_16 = (string.sub)(l_0_14.path, 1, l_0_15 - l_0_9)
        if l_0_2[l_0_16] ~= nil then
          (table.insert)(l_0_7, l_0_14.path)
        end
        if #l_0_7 >= 4 then
          local l_0_17 = {}
          l_0_17.appended_ext = l_0_8.appended_ext
          l_0_17.encrypted_file_meta = l_0_7
          ;
          (bm.trigger_sig)("GenericRansomware:Type4.2", safeJsonSerialize(l_0_17))
          ;
          (bm.add_related_string)("genda_delete_ransom_meta", safeJsonSerialize(l_0_17), bm.RelatedStringBMReport)
          return mp.INFECTED
        end
      end
    end
  end
end
do
  l_0_2 = mp
  l_0_2 = l_0_2.CLEAN
  return l_0_2
end

