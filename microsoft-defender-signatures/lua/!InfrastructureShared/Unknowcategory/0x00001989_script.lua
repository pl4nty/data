-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00001989_luac 

-- params : ...
-- function num : 0
DeleteRegistryEntriesOnValueMatch = function(l_1_0, l_1_1, l_1_2)
  -- function num : 0_0
  if l_1_0 == nil then
    return 
  end
  l_1_0 = l_1_2 == nil and (l_1_0)
  l_1_2 = true
  local l_1_3 = (sysio.RegEnumValues)(l_1_0)
  if l_1_3 == nil then
    return 
  end
  for l_1_7,l_1_8 in pairs(l_1_3) do
    if l_1_8 ~= nil then
      l_1_8 = (string.lower)(l_1_8)
      for l_1_12,l_1_13 in pairs(l_1_1) do
        -- DECOMPILER ERROR at PC39: Unhandled construct in 'MakeBoolean' P1

        if l_1_2 and l_1_8 == l_1_13 then
          (sysio.DeleteRegValue)(l_1_0, l_1_8)
        end
        if (string.find)(l_1_8, l_1_13, 1, true) then
          (sysio.DeleteRegValue)(l_1_0, l_1_8)
        end
      end
    end
  end
end

GetPathsFromExpandFilePath = function(l_2_0)
  -- function num : 0_1
  local l_2_1 = {}
  for l_2_5,l_2_6 in pairs(l_2_0) do
    local l_2_7 = (sysio.ExpandFilePath)(l_2_6, true)
    if l_2_7 ~= nil then
      for l_2_11,l_2_12 in pairs(l_2_7) do
        l_2_12 = (string.gsub)(l_2_12, "^\\\\%?\\", "")
        ;
        (table.insert)(l_2_1, l_2_12:lower())
      end
    end
  end
  do return l_2_1 end
  -- DECOMPILER ERROR at PC34: Confused about usage of register R2 for local variables in 'ReleaseLocals'

end


