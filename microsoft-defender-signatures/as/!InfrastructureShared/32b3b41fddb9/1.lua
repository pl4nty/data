-- Threat: !InfrastructureShared
-- Name: 32b3b41fddb9
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 then
  local l_0_0 = {}
  local l_0_1 = safeJsonDeserialize(this_sigattrlog[1].utf8p2)
  if not isnull(l_0_1) then
    for l_0_2 = 1, #l_0_1.file_paths do
      local l_0_3 = l_0_1.file_paths[l_0_2].path
      local l_0_4 = l_0_1.file_paths[l_0_2].renamed_path
      if not isnull(l_0_3) and not isnull(l_0_4) then
        local l_0_5 = l_0_3:match("[^\\]+$")
        local l_0_6 = l_0_4:match("[^\\]+$")
        local l_0_7 = l_0_6:match("(.+)%..+"):lower()
        local l_0_8 = l_0_5:match("(.+)%..+"):lower()
        if l_0_7 == l_0_8 then
          local l_0_9 = l_0_4:match("%.[^%.]+$"):lower()
          if l_0_9 and mp.GetExtensionClass(l_0_9) == 0 then
            if l_0_0[l_0_9] ~= nil then
              table.insert(l_0_0[l_0_9], 1)
            else
              l_0_0[l_0_9] = {1}
            end
            local l_0_10 = sysio.GetFileSize(l_0_4)
            local l_0_11 = sysio.ReadFile(l_0_4, 0, 4)
            l_0_1.file_paths[l_0_2].fileSize = l_0_10
            l_0_1.file_paths[l_0_2].magic = l_0_11
          end
        end
      end
    end
  end
  for l_0_12, l_0_13 in pairs(l_0_0) do
    if 4 <= #l_0_0[l_0_12] then
      l_0_1.rename_ext = l_0_12
      local l_0_14 = safeJsonSerialize(l_0_1)
      bm.add_related_string("genrn_ransom_meta", l_0_14, bm.RelatedStringBMReport)
      bm.trigger_sig("GenericRansomware:ReplaceExtension", l_0_14)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
