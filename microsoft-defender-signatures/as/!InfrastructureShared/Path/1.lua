-- Threat: !InfrastructureShared
-- Name: Path
-- Type: 1

local function l_0_0(l_1_0, l_1_1)
  return string.sub(l_1_0, 1, string.len(l_1_1)) == l_1_1
end

function towin32path(l_2_0)
  local l_2_1 = l_2_0
  if l_0_0(string.lower(l_2_0), "\\device\\") then
    l_2_1 = MpCommon.PathToWin32Path(l_2_0)
  end
  return l_2_1
end

function normalize_path(l_3_0)
  local l_3_1 = towin32path(l_3_0)
  if l_3_1 == nil then
    return nil
  end
  if 4 < #l_3_1 and l_3_1:sub(1, 4) == "\\\\?\\" then
    l_3_1 = l_3_1:sub(5)
  end
  return string.lower(l_3_1)
end
