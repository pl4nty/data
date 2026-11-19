-- Threat: !InfrastructureShared
-- Name: !#BM_RunPEinMemory
-- Type: 13

if mp.get_mpattributesubstring("Trojan:Win32/RunPEinMemory") then
  local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_0 == nil then
    return mp.INFECTED
  end
  l_0_0 = MpCommon.PathToWin32Path(l_0_0)
  if l_0_0 == nil then
    return mp.INFECTED
  end
  local l_0_1, l_0_2 = string.find(l_0_0, "->")
  if l_0_1 then
    l_0_0 = string.sub(l_0_0, 1, l_0_1 - 1)
  end
  local l_0_3 = "Trojan:Win32/RunPEinMemory"
  MpCommon.SetOriginalFileName(l_0_0, l_0_3)
  return mp.INFECTED
end
return mp.CLEAN
