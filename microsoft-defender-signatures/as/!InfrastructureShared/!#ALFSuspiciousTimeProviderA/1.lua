-- Threat: !InfrastructureShared
-- Name: !#ALF:Suspicious/TimeProvider.A
-- Type: 10
-- MpAttributes: RPF:TopLevelFile & pea_isdll & pea_hasexports & MpNewlyCreatedHint

local l_0_0 = {
  TimeProvOpen = "",
  TimeProvClose = "",
  TimeProvCommand = ""
}
local l_0_1 = 0
local l_0_2, l_0_3 = pe.get_exports()
if 2 < l_0_2 then
  for l_0_4 = 1, l_0_2 do
    local l_0_5 = pe.mmap_string_rva(l_0_3[l_0_4].namerva, 64)
    if l_0_0[l_0_5] then
      l_0_1 = l_0_1 + 1
    end
  end
  if l_0_1 ~= 3 then
    return mp.CLEAN
  end
  local l_0_6 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_6 == nil then
    return mp.CLEAN
  end
  if mp.IsKnownFriendlyFile(l_0_6, true, false) then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
