-- Threat: !InfrastructureShared
-- Name: ExcludeProc
-- Type: 1

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

function DeleteRegistryEntriesOnValueMatch(p1_0, p1_1, p1_2)
  if p1_0 == nil then
    return
  end
  p1_2 = p1_2 == nil or p1_2
  local r1_0 = sysio.RegEnumValues(p1_0)
  if r1_0 == nil then
    return
  end
  for r1_1, r1_2 in pairs(r1_0) do
    if r1_2 ~= nil then
      r1_2 = string.lower(r1_2)
      for r1_3, r1_4 in pairs(p1_1) do
        if p1_2 then
          if r1_2 == r1_4 then
            sysio.DeleteRegValue(p1_0, r1_2)
          end
        elseif string.find(r1_2, r1_4, 1, true) then
          sysio.DeleteRegValue(p1_0, r1_2)
        end
      end
    end
  end
end

function GetPathsFromExpandFilePath(p2_0)
  local r2_0 = {}
  for r2_1, r2_2 in pairs(p2_0) do
    local r2_3 = sysio.ExpandFilePath(r2_2, true)
    if r2_3 ~= nil then
      for r2_4, r2_5 in pairs(r2_3) do
        r2_5 = string.gsub(r2_5, "^\\\\%?\\", "")
        table.insert(r2_0, r2_5:lower())
      end
    end
  end
  return r2_0
end
