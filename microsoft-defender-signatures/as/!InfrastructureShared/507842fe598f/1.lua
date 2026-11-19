-- Threat: !InfrastructureShared
-- Name: 507842fe598f
-- Type: 21

if peattributes.isexe == false or peattributes.no_imports == true then
  return mp.CLEAN
end
if 0 ~= pe.query_import(pe.IMPORT_STATIC, 4277576571) or 0 ~= pe.query_import(pe.IMPORT_STATIC, 4277576570) then
  local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
  local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSDEVICEPATH)
  if l_0_1 == nil then
    return mp.CLEAN
  end
  local l_0_2 = MpCommon.PathToWin32Path(l_0_1):lower()
  if string.match(l_0_2, "\\program files") or string.match(l_0_2, "\\windows") then
    return mp.CLEAN
  end
  local l_0_3 = l_0_2 .. "\\" .. l_0_0
  mp.set_mpattribute("MpInternal_researchdata=cabParentPath=" .. l_0_3)
  return mp.INFECTED
end
return mp.CLEAN
