-- Threat: !InfrastructureShared
-- Name: !#SLF:MpEnableTechScamProtection
-- Type: 12

if MpCommon.NidSearch(mp.NID_ENABLE_EXTENDED_BAFS, 5) then
  local l_0_0 = {
    ["677e004c-862d-46a1-8cd7-2e37087bec9e"] = true,
    logmein = true,
    teamviewer = true,
    rescueassist = true,
    gotomeeting = true
  }
  local l_0_1 = {
    [".exe"] = true,
    [".msi"] = true
  }
  local l_0_2, l_0_3 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
  local l_0_4 = false
  local l_0_5 = false
  for l_0_6, l_0_7 in pairs(l_0_0) do
    if l_0_3:find(l_0_6, 1, true) ~= nil then
      l_0_4 = true
    end
  end
  for l_0_8, l_0_9 in pairs(l_0_1) do
    if l_0_3:find(l_0_8, 1, true) ~= nil then
      l_0_5 = true
    end
  end
  if l_0_4 == true and l_0_5 == true then
    return mp.INFECTED
  end
end
return mp.CLEAN
